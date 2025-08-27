#!/bin/bash

ENV_FILE=".env"
LOCAL_PATH="./src/"
EXCLUDE_FILE=".rsync-exclude"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

load_env() {
    if [ -f "$ENV_FILE" ]; then
        log "Loading environment variables from $ENV_FILE"
        export $(grep -v '^#' "$ENV_FILE" | xargs) 2>/dev/null
    else
        warn "Environment file $ENV_FILE not found"
        warn "Using default values or variables set in environment"
    fi
}

log() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

load_env

if ! command -v rsync &> /dev/null; then
    error "rsync is not installed. Please install it: sudo apt install rsync"
    exit 1
fi

if [ ! -f "$EXCLUDE_FILE" ]; then
    cat > "$EXCLUDE_FILE" << EOF
# Excluded files
*.tmp
*.log
.DS_Store
.thumbs
node_modules/
.git/
.env
*.swp
EOF
    log "Created exclude file: $EXCLUDE_FILE"
fi

deploy() {
    local dry_run=""
    if [ "$1" == "--dry-run" ]; then
        dry_run="--dry-run"
        warn "Dry-run mode - files will not be transferred"
    fi

    log "Starting synchronization with server..."
    log "Local folder: $LOCAL_PATH"
    log "Remote folder: $REMOTE_USER@$REMOTE_HOST:$REMOTE_PATH"

    rsync -avz --progress $dry_run \
        --delete \
        --exclude-from="$EXCLUDE_FILE" \
        -e "ssh -p $REMOTE_SSH_PORT -o StrictHostKeyChecking=no" \
        "$LOCAL_PATH" "$REMOTE_USER@$REMOTE_HOST:$REMOTE_PATH"

    if [ $? -eq 0 ]; then
        if [ "$dry_run" == "" ]; then
            log "Deployment completed successfully!"
            log "Website is available at: http://$REMOTE_HOST"
        else
            log "Dry-run completed. Check the list of changes."
        fi
    else
        error "Deployment failed!"
        exit 1
    fi
}

check_connection() {
    log "Checking connection to server..."
    ssh -p "$REMOTE_SSH_PORT" -o BatchMode=yes -o ConnectTimeout=5 "$REMOTE_USER@$REMOTE_HOST" echo "Connection established" 2>/dev/null
    if [ $? -eq 0 ]; then
        log "Connection to server established"
        return 0
    else
        error "Failed to connect to server"
        return 1
    fi
}

case "$1" in
    "--dry-run")
        deploy "--dry-run"
        ;;
    "--check")
        check_connection
        ;;
    "--help")
        echo "Usage: ./deploy.sh [options]"
        echo "Options:"
        echo "  --dry-run    Show what would be synchronized without actual transfer"
        echo "  --check      Check connection to server"
        echo "  --help       Show this help message"
        echo "  (no options) Perform deployment"
        ;;
    "")
        if check_connection; then
            deploy
        else
            error "Cannot deploy - no connection to server"
            exit 1
        fi
        ;;
    *)
        error "Unknown option: $1"
        echo "Use --help for usage information"
        exit 1
        ;;
esac
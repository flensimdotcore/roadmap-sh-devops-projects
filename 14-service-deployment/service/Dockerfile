FROM node:18-alpine

RUN apk add --no-cache \
    curl \
    git

RUN addgroup -g 1001 -S nodejs && \
    adduser -S nodejs -u 1001

WORKDIR /app

COPY package*.json ./

RUN npm install --only=production && npm cache clean --force

COPY --chown=nodejs:nodejs . .

USER nodejs

EXPOSE 3000

ENV NODE_ENV=production
ENV PORT=3000

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:3000/ || exit 1

CMD ["node", "app.js"]

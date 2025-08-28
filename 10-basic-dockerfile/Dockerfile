FROM alpine:latest

ARG NAME
ENV NAME=${NAME}

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

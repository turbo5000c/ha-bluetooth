FROM debian:bookworm

RUN apt-get update && \
    apt-get install -y bluetooth bluez dbus socat && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]

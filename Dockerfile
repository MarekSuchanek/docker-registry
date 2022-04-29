FROM registry:2.8.1

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

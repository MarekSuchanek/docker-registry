FROM registry:2.8.1

COPY ./docker/garbage-collect.sh /garbage-collect.sh
RUN chmod +x /garbage-collect.sh

COPY ./docker/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

FROM rabbitmq:3-management

COPY --chown=rabbitmq:rabbitmq rabbitmq.conf /etc/rabbitmq/rabbitmq.conf
COPY --chown=rabbitmq:rabbitmq definitions.json /etc/rabbitmq/definitions.json
COPY custom-docker-entrypoint.sh /usr/local/bin/custom-docker-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/custom-docker-entrypoint.sh"]
CMD ["rabbitmq-server"]

EXPOSE 4369 5672 15692 25672 35672-35682

#!/bin/sh

# NOTE:
# Without the initial sleep, you will probably hit this issue:
# https://github.com/docker-library/rabbitmq/issues/114
# https://github.com/docker-library/rabbitmq/issues/318
(sleep 10 && rabbitmqctl wait --timeout 60 "$RABBITMQ_PID_FILE"; \
    rabbitmqctl add_user "$RABBITMQ_DEFAULT_USER" "$RABBITMQ_DEFAULT_PASS" 2>/dev/null; \
    rabbitmqctl set_user_tags "$RABBITMQ_DEFAULT_USER" administrator; \
    rabbitmqctl set_permissions -p / "$RABBITMQ_DEFAULT_USER"  ".*" ".*" ".*"; \
    echo "****** User '$RABBITMQ_DEFAULT_USER' added ******") &

exec /usr/local/bin/docker-entrypoint.sh "$@"

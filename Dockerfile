FROM rabbitmq:3.12.10
ENV DEBIAN_FRONTEND=noninteractive;
ENV DEBCONF_NONINTERACTIVE_SEEN=true;
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN apt-get update && apt-get install -y --no-install-recommends wget && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
USER rabbitmq
RUN wget -P /opt/rabbitmq/plugins/ --no-check-certificate https://github.com/rabbitmq/rabbitmq-delayed-message-exchange/releases/download/v3.12.0/rabbitmq_delayed_message_exchange-3.12.0.ez \
    && rabbitmq-plugins enable rabbitmq_delayed_message_exchange
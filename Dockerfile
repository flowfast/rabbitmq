FROM rabbitmq:latest
ENV DEBIAN_FRONTEND=noninteractive;
ENV DEBCONF_NONINTERACTIVE_SEEN=true;
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN apt-get update -qqy && apt-get install -qqy --no-install-recommends wget && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && wget -P /opt/rabbitmq/plugins/ --no-check-certificate https://github.com/rabbitmq/rabbitmq-delayed-message-exchange/releases/download/3.9.0/rabbitmq_delayed_message_exchange-3.9.0.ez \
 && rabbitmq-plugins enable rabbitmq_delayed_message_exchange

FROM debian:9.5-slim

LABEL "com.github.actions.name"="Build Status Webhook"
LABEL "com.github.actions.description"="Send the build status to a webhook"
LABEL "com.github.actions.icon"="code"
LABEL "com.github.actions.color"="purple"

LABEL "repository"="https://github.com/WalshyDev/Build-Status-Webhook"
LABEL "maintainer"="WalshyDev <walshydev@gmail.com>"

RUN apt-get update && apt-get install curl git -y

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
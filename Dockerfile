FROM node:14.20.0-alpine3.16

# Install hubot dependencies
RUN apk update \
 && apk upgrade \
 && apk add jq \
 && apk add git \
 && npm install -g yo generator-hubot@next \
 && rm -rf /var/cache/apk/*

# Create hubot user with privileges
RUN addgroup -g 501 hubot \
 && adduser -D -h /hubot -u 501 -G hubot hubot
ENV HOME /home/hubot
WORKDIR $HOME
COPY entrypoint.sh ./
RUN chown -R hubot:hubot .
USER hubot

# Install hubot version HUBOT_VERSION
ENV HUBOT_NAME "jarvis"
ENV HUBOT_OWNER "ThunderDucks"
RUN yo hubot \
 --adapter=slack \
 --owner="$HUBOT_OWNER" \
 --name="$HUBOT_NAME" \
 --description="$HUBOT_DESCRIPTION" \
 --defaults
ARG HUBOT_VERSION="3.3.2"
RUN jq --arg HUBOT_VERSION "$HUBOT_VERSION" '.dependencies.hubot = $HUBOT_VERSION' package.json > /tmp/package.json \
 && mv /tmp/package.json .

EXPOSE 8080

RUN chmod +x entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]

CMD ["--name", "$HUBOT_NAME", "--adapter", "slack"]

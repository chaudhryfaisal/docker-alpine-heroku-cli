FROM node:10.5.0-alpine

ENV HEROKU_CLI_VERSION '7.24.1'
RUN apk --update add openjdk8-jre bash
RUN yarn global add heroku@$HEROKU_CLI_VERSION && \
	heroku plugins:install java

ENTRYPOINT ["/usr/local/bin/heroku"]
FROM node:10.5.0-alpine

ENV HEROKU_CLI_VERSION '7.18.3'
RUN yarn global add heroku@$HEROKU_CLI_VERSION && \
	heroku plugins:install java && \
	apk --update add openjdk8-jre

ENTRYPOINT ["/usr/local/bin/heroku"]
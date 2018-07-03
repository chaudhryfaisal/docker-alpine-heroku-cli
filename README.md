# Alpine Heroku CLI

This image packages the [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli) and docker inside an Alpine Linux based Docker container to be used with `gitlab`.

## Usage

The easiest way to use this would be to use your Heroku [API key](https://dashboard.heroku.com/account) or an [OAuth authorization token](https://github.com/heroku/heroku-cli-oauth#authorizations) set as the `HEROKU_API_KEY` environment variable.

Another method would be to mount your `~/.netrc` as a volume on the docker container. This would use your local Heroku login credentials for authentication.

```yaml

deploy-dev:
  stage: deploy-dev
  stage: chaudhryfaisal/docker-alpine-heroku-cli
  environment:
    name: dev
  script:
    - export HEROKU_API_KEY=${HEROKU_API_KEY}
    - docker login --username=_ --password=$HEROKU_API_KEY  registry.heroku.com
    - heroku config:set SPRING_PROFILES_ACTIVE=dev --app $HEROKU_APP_NAME
    - heroku container:push web --app $HEROKU_APP_NAME
    - heroku container:release web --app $HEROKU_APP_NAME

```

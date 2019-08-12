NAME := docker-alpine-heroku-cli

IMAGE_URL := chaudhryfaisal/$(NAME)

build:
	docker build --pull -t ${IMAGE_URL} .

run: build
	docker run -p 8091:80 -it ${IMAGE_URL}

push: build
	docker push ${IMAGE_URL}

NAME := docker-alpine-heroku-cli

IMAGE_URL := chaudhryfaisal/$(NAME)

image-create:
	docker build --pull -t ${IMAGE_URL} .

run: image-create
	docker run -p 8091:80 -it ${IMAGE_URL}

push: image-create
	docker push ${IMAGE_URL}

IMG_NAME := ao-svc

help:
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

img:             ## Build docker image
	@docker build -f Dockerfile --rm -t $(IMG_NAME):master .
	@docker tag $(IMG_NAME):master $(IMG_NAME)
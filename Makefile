IMAGE_NAME = s2i-pile2-centos7

.PHONY: build
build:
	docker build -t $(IMAGE_NAME) .

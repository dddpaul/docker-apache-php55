.PHONY: all build release

IMAGE=dddpaul/apache-php55
VERSION=$(shell cat VERSION)

all:	build

build:
	@docker build --tag=${IMAGE} .

debug:
	@docker run -it --rm --entrypoint=sh ${IMAGE}

run:
	@docker run -P --rm ${IMAGE}

release: build
	@docker build --tag=${IMAGE}:${VERSION} .

deploy: release
	@docker push ${IMAGE}
	@docker push ${IMAGE}:$(shell cat VERSION)

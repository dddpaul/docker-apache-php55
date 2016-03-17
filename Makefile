all: build

build:
	@docker build --tag=smile/apache-php .

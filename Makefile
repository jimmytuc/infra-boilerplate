ifndef env
	env=development
endif

up:
	docker-compose -f environment/$(env).yml up --build -d
stop:
	docker-compose -f environment/$(env).yml stop
down:
	docker-compose -f environment/$(env).yml down
build:
	export APP_VERSION=${APP_VERSION}
	docker-compose -f environment/build.yml build --no-cache
push:
	export APP_VERSION=${APP_VERSION}
	$(aws ecr get-login --no-include-email --region ap-southeast-1)
	docker-compose -f environment/build.yml push

ifndef env
	env=development
endif

up:
	docker-compose -f environment/$(env).yml up --build -d
	cp config/config-$(env).cfg config/config.cfg
stop:
	docker-compose -f environment/$(env).yml stop
down:
	docker-compose -f environment/$(env).yml down

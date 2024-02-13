COMPOSE_F 	= srcs/docker-compose.yml
ENV_F		= srcs/.env

VOLUMES_DIR		:=	db wordpress
VOLUMES_PATH	:=	/home/hgeffroy/data/
VOLUMES			:=	$(addprefix $(VOLUMES_PATH)/, $(VOLUMES_DIR))

all:
	mkdir -p $(VOLUMES)
	docker compose -f $(COMPOSE_F) --env-file=$(ENV_F) up -d --build

up:
	docker compose -f $(COMPOSE_F) --env-file=$(ENV_F) up -d

down:
	docker compose down

re: down up

clean:
	docker rmi -f $$(docker images -qa);
	docker stop $$(docker ps -qa);
	docker system prune -a --force;
	docker volume rm $$(docker volume ls -q);
	docker network rm $$(docker notwork ls -q);
	rm -rf $(VOLUMES)

.PHONY: re clean up down all
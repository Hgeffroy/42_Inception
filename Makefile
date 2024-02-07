COMPOSE_F 	= srcs/docker-compose.yml
ENV_F		= srcs/.env

VOLUMES_DIR		:=	db wordpress
VOLUMES_PATH	:=	$(HOME)/data/inception_data
VOLUMES			:=	$(addprefix $(VOLUMES_PATH)/, $(VOLUMES_DIR))

all:
	docker compose -f $(COMPOSE_F) --env-file=$(ENV_F) up -d --build
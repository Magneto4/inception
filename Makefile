all:
			mkdir -p /home/nseniak/data/mariadb
			mkdir -p /home/nseniak/data/wordpress
			docker-compose -f ./srcs/docker-compose.yml up -d

delete:
			-@docker stop $$(docker ps -qa)
			-@docker rm $$(docker ps -qa)
			-@docker rmi -f $$(docker images -qa)
			-@docker volume rm $$(docker volume ls -q)
			-@docker network rm $$(docker network ls -q)
			# -@rm -rf /home/nseniak/data
			-@pkill nginx

wordpress:
			docker stop wordpress
			docker rm wordpress
			docker rmi srcs_wordpress

mariadb:
			docker stop mariadb
			docker rm mariadb
			docker rmi srcs_mariadb

nginx:
			docker stop nginx
			docker rm nginx
			docker rmi srcs_nginx

re:			delete all

.PHONY:		all delete re wordpress mariadb nginx

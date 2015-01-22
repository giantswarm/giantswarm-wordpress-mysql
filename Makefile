PROJECT = wordpress
REGISTRY = registry.giantswarm.io
USERNAME :=  $(shell swarm user)

#https://registry.hub.docker.com/_/mysql/

run-mysql:
	docker run --name some-mysql -e MYSQL_ROOT_PASSWORD=mysecretpassword -d mysql:5.5


run-wordpress:
	docker run --name some-wordpress --link some-mysql:mysql -p 8080:80 -e MYSQL_ROOT_PASSWORD=mysecretpassword11 -d wordpress:latest

deploy:
	swarm up swarm.json --var=username=$(USERNAME)
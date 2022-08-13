all: have-image

sudoers:
	echo root "ALL=(ALL:ALL)" NOPASSWD: ALL > sudoers
	echo $(USER) "ALL=(ALL:ALL)" NOPASSWD: ALL >> sudoers


have-image: sudoers
	docker build -t cloudserver:dev .
	touch have-image

start:

clean:
	-./stop
	rm -f mirrorlist sudoers have-image server.cid
	docker image prune --force
	docker system prune --force
	docker container ls -a

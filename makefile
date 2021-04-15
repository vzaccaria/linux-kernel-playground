build:
	docker build .  -t lkp

connect:
	docker run -ti -p 5900:5900 -v `pwd`:/local --rm lkp:latest /bin/bash 

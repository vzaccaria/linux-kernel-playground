build:
	docker build .  -t lkp

connect:
	docker run -ti -p 5900:5900 -v `pwd`/scripts:/scripts --rm lkp:latest /bin/bash 

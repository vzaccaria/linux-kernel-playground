build:
	docker build .  -t lkp

connect:
	docker run -ti -p 5900:5900 -v `pwd`/scripts:/scripts -v `pwd`/demos:/demos --rm lkp:latest /bin/bash 

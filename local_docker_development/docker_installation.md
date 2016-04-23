# Installation


Installation of the amazee.io local Docker Development depends on each operating system:
 
## Prerequisites - OS X
- You first need to install [amazee.io cachalot](./os_x_cachalot.md)
- [docker-compose](https://docs.docker.com/compose/install/) preferably installed via `brew install docker-compose`


## Installation

- Clone the repo [amazeeio-docker](https://github.com/amazeeio/amazeeio-docker) somewhere on your local computer

	```
	git clone https://github.com/amazeeio/amazeeio-docker.git amazeeio-docker
	```

- Start the shared containers inside the cloned repo (they are defined that they automatically start themselves in the future)

	```
	cd amazeeio-docker
    docker-compose up -d
	```
# Part I: Shared Containers


Installation of the amazee.io local Docker Development depends on each operating system:

## Prerequisites - OS X
- You first need to install [amazee.io cachalot](./os_x_cachalot.md)
- [docker-compose](https://docs.docker.com/compose/install/) preferably installed via `brew install docker-compose`

Please see Brew documentation for installing bew on your Mac.


## Installation

- Clone the repository [amazeeio-docker](https://github.com/amazeeio/amazeeio-docker) somewhere on your local computer

	```
	git clone https://github.com/amazeeio/amazeeio-docker.git amazeeio-docker
	```

## Start Shared Containers
- Start the shared containers inside the cloned repository (they are defined that they automatically start themselves in the future)

	```
	cd amazeeio-docker
    docker-compose up -d
	```

## Test

Open http://docker.amazee.io/stats

If you see something like this screenshot, all is perfect:
![](Statistics_Report_for_HAProxy_on_c06d7fc60984.jpg)

# Usage:
# make                       #
# make init_submodules         # Initialize git submodules 
# make update_docker           # update docker-ngmm_tools repository
# make update_ngmmtools        # udpate ngmm_tools submodule
# make update_cmdstan          # update cmdstan submodule
# make update_submodules       # Updates all git submodules
# make download_synds_files    # Downloads teh synthetic datasets for verification exercise
# make download_exampfiles     # Downloads the example regression files
# make build_stan              # Compiles STAN
# make build_clean             # Just builds docker image
# make build_lite              # Initialize/Updates submoduels and builds docker image
# make build_full              # Builds docker image and downloads the example dataset
# make build                   # Defualt build option
# make run                     # Runs docker container 
# make clean_docker_containers # Remove exited containers
# make clean_docker_images     # Remove dangling images
# make clean_docker_all        # Remove all images and containers

.PHONY = all clean build_stan
.DEFAULT_GOAL := all

TAG=nhr3webhub/ngmm-tools
PWD=$(shell pwd)

all: update_submodules build run

init_submodules:
	git submodule update --init --recursive
	
update_docker:
	git pull origin main
	
update_ngmmtools: init_submodules
	git submodule update --remote --merge ngmm_tools

update_cmdstan: init_submodules
	git submodule update --remote --merge cmdstan

update_submodules: update_ngmmtools update_cmdstan

update_all: update_submodules update_docker

download_synds_files:
	cd ngmm_tools && $(MAKE) download_rawfiles
	cd ngmm_tools && $(MAKE) download_synds

download_examp_files:
	cd ngmm_tools && $(MAKE) download_exampfiles

build_stan: init_submodules
	cd cmdstan && $(MAKE) build

build_clean:
	docker build . -t $(TAG)

build_lite: init_submodules build_clean

build_full: init_submodules build_clean download_examp_files

build: build_lite

pull:
	docker pull $(TAG)

run:
	docker run --rm -p 8888:8888 -v "$(PWD)":/home/jovyan/work $(TAG)

clean_docker_containers:
	docker rm $(docker ps -a -q -f status=exited)
	
clean_docker_images:
	docker images -f dangling=true
	
clean_docker_all:
	docker system prune -a

clean: clean_docker_all

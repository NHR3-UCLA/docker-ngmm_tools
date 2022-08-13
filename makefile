# Usage:
# make                       #
# make init_submodules       # Initialize git submodules 
# make update_submodules     # Updates git submodules
# make download_synds_files  # Downloads teh synthetic datasets for verification exercise
# make download_exampfiles   # Downloads the example regression files
# make build_stan            # Compiles STAN
# make build_clean           # Just builds docker image
# make build_lite            # Initialize/Updates submoduels and builds docker image
# make build_full            # Builds docker image and downloads the example dataset
# make build                 # Defualt build option
# make run                   # Runs docker container 

.PHONY = all clean build_stan
.DEFAULT_GOAL := all

TAG=ngmm-tools
PWD=$(shell pwd)

all: update_submodules build run

init_submodules:
	git submodule update --init --recursive       

update_submodules: init_submodules
	git submodule update --remote --merge

download_synds_files:
	cd ngmm_tools && $(MAKE) download_rawfiles
	cd ngmm_tools && $(MAKE) download_synds

download_examp_files:
	cd ngmm_tools && $(MAKE) download_exampfiles

build_stan: update_submodules
	cd cmdstan && $(MAKE) build

build_clean:
	docker build . -t $(TAG)

build_lite: update_submodules build_clean

build_full: update_submodules build_clean download_examp_files

build: build_full

run: build_clean
	docker run --rm -p 8888:8888 -v "$(PWD)":/home/jovyan/work $(TAG)

clean:

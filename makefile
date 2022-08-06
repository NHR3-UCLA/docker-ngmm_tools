# Usage:
# make                       # 
# make update_submodules     # Updates git submodules
# make download_synds_files  # Downloads teh synthetic datasets for verification exercise
# make download_exampfiles   # Downloads the example regression files
# make build_stan            # Compiles STAN
# make build                 # Builds docker image and downloads the example dataset
# make build_lite            # Just builds docker image
# make run                   # Runs docker container 

.PHONY = all clean build_stan
.DEFAULT_GOAL := all

TAG=ngmm-tools
PWD=$(shell pwd)

all: update_submodules build run

update_submodules:
	git submodule update --init --recursive
	git submodule update --remote --merge

download_synds_files:
	cd ngmm_tools && $(MAKE) download_rawfiles
	cd ngmm_tools && $(MAKE) download_synds

download_examp_files:
	cd ngmm_tools && $(MAKE) download_exampfiles

build_stan: update_submodules
	cd cmdstan && $(MAKE) build

build_lite: update_submodules
	docker build . -t $(TAG)

build: build_lite download_examp_files

run: build_lite
	docker run --rm -p 8888:8888 -v "$(PWD)":/home/jovyan/work $(TAG)

clean:

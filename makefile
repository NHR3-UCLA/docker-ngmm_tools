# Usage:
# make                    # 
# make update_submodules  # Updates git submodules
# make download_synds     # Download synthetic datasets for verification exercise
# make build_stan         # Compiles STAN
# make build              # Builds docker image
# make run                # Runs docker container 

.PHONY = all clean build_stan
.DEFAULT_GOAL := all

TAG=ngmm-tools
PWD=$(shell pwd)

all: update_submodules build run

update_submodules:
	git submodule update --init --recursive

download_synds_files:
	cd ngmm_tools && $(MAKE) download_rawfiles
	cd ngmm_tools && $(MAKE) download_synds

build_stan: update_submodules
	cd cmdstan && $(MAKE) build

build: update_submodules
	docker build . -t $(TAG)

run: build
	docker run --rm -p 8888:8888 -v "$(PWD)":/home/jovyan/work $(TAG)

clean:

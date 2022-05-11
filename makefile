# Usage:
# make                    # 
# make update_submodules  # Updates git submodules
# make download_synds     # Download synthetic datasets for verification exercise

.PHONY = all clean build_stan
.DEFAULT_GOAL := all

TAG=ngmm-tools
PWD=$(shell pwd)

all: update_submodules build_stan

update_submodules:
	git submodule update --init --remote --recursive

download_synds_files:
	cd ngmm_tools && $(MAKE) download_rawfiles
	cd ngmm_tools && $(MAKE) download_synds

build_stan: 
	cd cmdstan && $(MAKE) build

build: 
	docker build . -t $(TAG)

run: build
	docker run --rm -p 8888:8888 -v "$(PWD)":/home/jovyan/work $(TAG)

clean:

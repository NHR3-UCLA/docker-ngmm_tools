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
	
build_stan: 
	cd cmdstan && $(MAKE) build
	
download_synds_files:
	cd ngmm_tools && $(MAKE) download_rawfiles
	cd ngmm_tools && $(MAKE) download_synds

clean:

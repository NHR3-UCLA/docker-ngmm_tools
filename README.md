# Dockerfile for Non-ergodic Methodology and Modeling Tools

This repository builds a Docker image of for the Non-Ergodic Methodology and Modeling tools in `NHR3-UCLA/ngmm_tools` 


## Installing NGMM Tools:

### Command line Instalation
The following instructions assume you have access to your computer's  command-line terminal window (e.g. PowerShell for Windows or Bash for Linux), and have installed Git and Docker. 
Information on installing Git can be found here (https://github.com/git-guides/install-git). Information on installing Docker can be found here (https://docs.docker.com/get-docker).

Instalation instructions:

 * Open a command-line terminal window and move to the directory you would like to install the tools <br> (e.g. ``cd /home/glavrent/Work/Research/``)
 * Clone current repository ``git clone https://github.com/NHR3-UCLA/docker-ngmm_tools.git``
 * Change directories to Docker NGMM Tools home directory ``cd docker-ngmm_tools``
 * Build Docker image and download the example dataset with ``make build``, or just build the Docker image with ``make build_lite`` 
 
## Running NGMM Tools:

* Open a command-line terminal window and move to the  Docker NGMM Tools home directory <br> (e.g. ``cd /home/glavrent/Work/Research/docker-ngmm_tools``)
* Run ``make run``
* Copy the Jupyer URL (it looks like: http://127.0.0.1:8888/lab?token=5214a...), and open it on your web browser

The current directory is linked to the ``~\work`` directory in the virtual machine. Any regression datasets are located in ``~\work\ngmm_tools\Data``.

## Updating NGMM Tools:

 The `NHR3-UCLA/ngmm_tools` repository is continously updated with more efficient implementions of the existing non-ergodic tools and new tools that capture a greater portion of the systematic non-ergodic effects. To update the ``ngmm_tools`` submodule within this repository:
 
* Open a command-line terminal window and move to the  Docker NGMM Tools home directory <br> (e.g. ``cd /home/glavrent/Work/Research/docker-ngmm_tools``)
* Run ``make update_submodules``

## Downloading Example Files, Synthetic Datasets, and Raw Data:

 * First, run Docker container and select terminal in Jupyter Lab 
 * change to work directory ``cd work``,  then:
   - run ``make download_examp_files`` to download example regression dataset, or
   - run ``make download_synds_files`` to download all synthetic datasets and raw metadata 

Alternatively, the files can be downladed through the links the products section in https://www.risksciences.ucla.edu/nhr3/ngmm

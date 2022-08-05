# Dockerfile for Non-ergodic Methodology and Modeling Tools

This repository builds a Docker image of for the Non-Ergodic Methodology and Modeling tools in `NHR3-UCLA/ngmm_tools` 


## Tools Instalation

### Command line Instalation
The following instructions assume you have access to your computer's  command-line terminal window (e.g. PowerShell for Windows or Bash for Linux), and have installed Git and Docker. 
Information on installing Git can be found here (https://github.com/git-guides/install-git). Information on installing Docker can be found here (https://docs.docker.com/get-docker)

Instalation instructions:

 * Open command-line terminal window and move to the directory you would like to install the tools <br> (e.g. ``cd /home/glavrent/Work/Research/``)
 * Clone current repository ``git clone https://github.com/NHR3-UCLA/docker-ngmm_tools.git``
 * Change directories to Docker NGMM Tools home directory ``cd docker-ngmm_tools``
 * Build Docker container with ``make build`` 
 
## Running NGMM Tools:

* Open command-line terminal window and move to the  Docker NGMM Tools home directory <br> (e.g. ``cd /home/glavrent/Work/Research/docker-ngmm_tools``)
* Run Docker container ``make run``
* Copy Jupyer URL, it looks like , and open it on your web browser

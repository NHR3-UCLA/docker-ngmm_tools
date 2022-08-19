# Docker Image for Non-ergodic Methodology and Modeling Tools

This repository builds a Docker image of for the Non-Ergodic Methodology and Modeling tools in `NHR3-UCLA/ngmm_tools` 


## Installing NGMM Tools

The NGMM Tools docker image can either be obtained from the [Docker Hub](https://hub.docker.com/r/nhr3webhub/ngmm-tools) or can be built using the source code in this repository. Both methods require the use of the command-line terminal. For Windows users, it is recommended to use PowerShell, MINIGW64, Git Bash, or any other terminal window that uses the POSIX interface. The [Docker Desktop](https://www.docker.com/products/docker-desktop/) is recommended for the users not comfortable with command line instructions, as it is easier to manage the Docker containers and images. Alternatively, the user can just install the [Docker Engine](https://docs.docker.com/engine/install/). The other software required in this installation is [Git](https://github.com/git-guides/install-git). It is a verison control software which is used in this project to download the ``ngmm-tools`` and `'cmdstan`` files from GitHub. For Windows users, when installing Git, for the question ``Which editor would you like Git to use?`` it is recommended to select ``Use Notepad as Git's default editor``, and for the question ``How would you like ot use Git form the command line?`` it is recommended to select ``Git form the command line and also from 3rd-party software``.

### Docker Hub Installation

 * Start Docker, if not already running in the background
 * Open a command-line terminal window and move to the directory you would like to install the tools <br> (e.g. ``cd /home/glavrent/Work/Research/``)
 * Pull the image from the Docker Hub ``docker pull nhr3webhub/ngmm-tools``
 * Clone the NGMM tools Docker repository and submoduels ``git clone https://github.com/NHR3-UCLA/docker-ngmm_tools.git --recursive``
 
 ### Source Code Installation from GitHub

 * Start Docker, if not already running in the background
 * Open a command-line terminal window and move to the directory you would like to install the tools <br> (e.g. ``cd /home/glavrent/Work/Research/``)
 * Clone the current repository ``git clone https://github.com/NHR3-UCLA/docker-ngmm_tools.git``
 * Change directories to Docker NGMM Tools home directory ``cd docker-ngmm_tools``
 * Build Docker image with ``make build``
 
## Running NGMM Tools

* Open a command-line terminal window and move to the Docker NGMM Tools home directory <br> (e.g. ``cd /home/glavrent/Work/Research/docker-ngmm_tools``)
* Lunch the Docker container ``make run``
* Copy the Jupyer URL (it looks like: http://127.0.0.1:8888/lab?token=5214a...), and open it on your web browser

The current directory is linked to the ``~\work`` directory in the virtual machine. 

## Updating NGMM Tools

 The `NHR3-UCLA/ngmm_tools` repository is continuously updated with more efficient implementations of the existing non-ergodic tools and new tools that capture a greater portion of the systematic non-ergodic effects. To update the ``ngmm_tools`` submodule within this repository:
 
* Start the Docker container, and lunch the terminal from Jupyter Lab
* Change to the Work directory ``cd Work``
* Run ``make update_ngmmtools``

## Downloading Example Files and Synthetic Datasets

* Start the Docker container, and lunch the terminal from Jupyter Lab
 * change to work directory ``cd work``
   - run ``make download_examp_files`` to download example regression dataset, or
   - run ``make download_synds_files`` to download all synthetic datasets and raw metadata 

Alternatively, the files can be downladed through the links the products section in https://www.risksciences.ucla.edu/nhr3/ngmm

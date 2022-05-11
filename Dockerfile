# Use jupyter/r-notebook Docker container as a starting container
# Includes Jupyter with support for Python and R 
# https://jupyter-docker-stacks.readthedocs.io/en/latest/using/selecting.html

FROM jupyter/r-notebook:latest


# Install system dependencies
# ----------------------------
USER root

# Intall ffmpeg for matplotlib anim, 
# dvipng+cm-super for latex labels,
# g++ to compile STAN, and
RUN apt-get update --yes && \
	apt-get install --yes --no-install-recommends \
        ffmpeg dvipng cm-super vim g++ && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Intall other dependencies
# ---------------------------
USER ${NB_UID}

# Install STAN
# ---   ---   ---   ---   ---
COPY --chown=${NB_UID} cmdstan "/home/${NB_USER}/cmdstan"
RUN cd "/home/${NB_USER}/cmdstan" && \
    make build && \
    pwd
ENV CMDSTAN "/home/${NB_USER}/cmdstan"

# Install python and R dependencies
# ---   ---   ---   ---   ---
# Python dependencies:
#   mamba:
#     arviz, joblib, matplotlib, numpy
#     nest-asyncio, pandas, scipy
#     pystan<3
#   pip:
#     pystan, cmdstanpy, gdown
RUN mamba install --quiet --yes \
        'arviz' \
        'joblib' \
        'matplotlib' \
        'numpy' \
        'nest-asyncio' \
        'pandas' \
        'pystan<3' \
        'scipy' \
        'r-essentials' \
        'r-base<4.2' \
        'r-rgeos' \
        'r-rgdal' \
        && \
    mamba clean --all -f -y && \
    pip install --no-cache-dir pystan cmdstanpy gdown && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

# Install R dependencies
COPY scripts/install_R_dependencies.R "/home/${NB_USER}/"
RUN Rscript install_R_dependencies.R && rm install_R_dependencies.R



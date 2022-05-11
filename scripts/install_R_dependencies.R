#-------------------------------------------------
# This script installs the necessary packages to
# run the non-ergodic GMM regression with INLA
#-------------------------------------------------

repos = getOption('repos')
repos['CRAN'] <- 'https://cran.us.r-project.org'
options(repos=repos, timeout=800)

#install other packages
install.packages(c('sp',
                   'fields',
                   'viridisLite',
                   'stringr',
                   'assertthat',
                   'pracma',
                   'posterior',
                   'ggplot2',
                   'maps'),
                 dependencies=TRUE)

#intall R-INLA
install.packages(c("INLA","inlabru"), repos=c(getOption("repos"),
                 INLA="https://inla.r-inla-download.org/R/stable"), dep=TRUE)

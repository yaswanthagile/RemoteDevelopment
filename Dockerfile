
FROM store/oracle/serverjre:8

# This is the folder all project specifc content reside
ENV DEV_HOME=/u01/base

# Locaiton to place code
ENV REPO_HOME=${DEV_HOME}/repo

# Location for all installable softwares
ENV SOFTWARE_REPO=${DEV_HOME}/softwares 

# User which is going to be docker user
ENV USER_NAME=developer
ENV GROUP=staff

# Installs git and Zip extractor 
RUN yum install git bzip2 -y

# As rool new user, user group and folder structure will be created
USER root
RUN  groupadd -g 1001 ${GROUP} 
RUN mkdir -p ${SOFTWARE_REPO} && \
    mkdir -p ${REPO_HOME} 

# Adds user ${USER_NAME} and grants permissions.
RUN adduser -ms /u01/base -d ${DEV_HOME} ${USER_NAME}

# Install all required tools for development
WORKDIR ${SOFTWARE_REPO}
RUN chown -R ${USER_NAME}:${GROUP} ${DEV_HOME}
USER $USER_NAME
COPY installer.sh .
RUN sh installer.sh

WORKDIR ${REPO_HOME}

CMD ["/bin/bash"]
ARG FROM_IMG_REGISTRY=docker.io
ARG FROM_IMG_REPO=qnib
ARG FROM_IMG_NAME=uplain-jupyterhub
ARG FROM_IMG_TAG=latest
ARG FROM_IMG_HASH=''
FROM ${FROM_IMG_REGISTRY}/${FROM_IMG_REPO}/${FROM_IMG_NAME}:${FROM_IMG_TAG}${DOCKER_IMG_HASH}

# install dockerspawner
RUN pip3 install dockerspawner

ENV NB_USER=jovyan \
    NB_UID=1000 \
    NB_GID=100
RUN groupadd wheel -g 11 \
 && echo "auth required pam_wheel.so use_uid" >> /etc/pam.d/su \
 && useradd -m -s /bin/bash -N -u $NB_UID $NB_USER -p $(openssl passwd -1 $NB_USER)
# change config
ENV DOCKER_NOTEBOOK_DIR=/notebooks
COPY jupyterhub_config.py /etc/jupyterhub/jupyterhub_config.py

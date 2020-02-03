# base image
FROM nimlang/nim:1.0.4-regular

# install dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends libpq-dev netcat-openbsd

# set working directory
WORKDIR /usr/src/app

# Nim environment
ARG NIM_ENV=production
ENV NIM_ENV $NIM_ENV

# make entrypoint executable
COPY ./entrypoint.sh .
RUN chmod +x entrypoint.sh

# install dependencies, bundle assets, compile
ENV NIMBLE_DIR=/home/nim/.nimble
ENV PATH=$PATH:/home/nim/.nimble/bin
RUN nimble refresh && nimble install nimassets jester

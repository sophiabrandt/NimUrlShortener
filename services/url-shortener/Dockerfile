# base image
FROM nimlang/nim:1.0.4-regular

# install dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends libpq-dev netcat-openbsd

# set working directory
WORKDIR /usr/src/app

# install dependencies
COPY ./urlShortener.nimble .
RUN nimble refresh && nimble install jester nimassets

# entrypoint
COPY ./entrypoint.sh .
RUN chmod +x entrypoint.sh

# Nim environment
ARG NIM_ENV=production
ENV NIM_ENV $NIM_ENV

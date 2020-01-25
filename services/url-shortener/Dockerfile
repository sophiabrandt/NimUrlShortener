# base image
FROM nimlang/nim:1.0.4-regular

# install dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends libpq-dev

# set working directory
WORKDIR /usr/src/app

# run server
# CMD nimble c -ry src/urlShortener

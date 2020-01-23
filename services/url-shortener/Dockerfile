# base image
FROM nimlang/nim:1.0.4-regular AS build-image

# set working directory
WORKDIR /usr/src/app

# run server
CMD nimble c -ry src/urlShortener

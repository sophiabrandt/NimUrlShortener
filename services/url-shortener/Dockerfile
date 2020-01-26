# base image
FROM nimlang/nim:1.0.4-regular

# install dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends libpq-dev netcat-openbsd

# set working directory
WORKDIR /usr/src/app

# add entrypoint.sh
COPY ./entrypoint.sh /usr/src/app/entrypoint.sh
RUN chmod +x /usr/src/app/entrypoint.sh

# Nim environment
ARG NIM_ENV=production
ENV NIM_ENV $NIM_ENV

# RUN script
ENTRYPOINT ["./entrypoint.sh"]
CMD nimble c -ry src/urlShortener

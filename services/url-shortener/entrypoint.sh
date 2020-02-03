#!/bin/sh

echo "Waiting for postgres..."

while ! nc -z ${DB_NAME} 5432; do
  sleep 0.1
done

echo "PostgreSQL started"

# run server
nimassets -d=public -o=src/views/assetsfile.nim && \
  nimble c -ry src/urlShortener

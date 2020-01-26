#!/bin/sh

echo "Waiting for postgres..."

while ! nc -z ${DB_NAME} 5432; do
  sleep 0.1
done

echo "PostgreSQL started"

# run server
nimble c -ry src/urlShortener

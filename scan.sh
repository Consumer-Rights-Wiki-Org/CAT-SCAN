#!/bin/bash

FILENAME="$1"

if [ -z "$FILENAME" ]; then
  echo "Usage: $0 <filename>"
  exit 1
fi

CONTAINER_NAME="euphie"

echo "Waiting for clamav container to be healthy..."
until docker inspect --format='{{.State.Health.Status}}' "$CONTAINER_NAME" | grep -q "healthy"; do
  sleep 1
done
echo "clamav container is healthy."

echo "Copying $FILENAME to $CONTAINER_NAME:/files/"
docker cp "$FILENAME" "$CONTAINER_NAME:/files/"

echo "Running clamscan on /files/$FILENAME inside Container $CONTAINER_NAME..."
docker exec "$CONTAINER_NAME" clamscan "/files/$FILENAME"

docker exec "$CONTAINER_NAME" rm "/files/$FILENAME"
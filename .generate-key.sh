#!/usr/bin/env bash

if [ -z "$1" ]; then
    echo "Usage: $0 <peer-name>"
    exit 1
fi

PEER_NAME=$1
shift

SECRET_FILE="${PEER_NAME}.key"

SECRET="$(fastd --generate-key --machine-readable)";

echo "secret \"$(fastd --generate-key --machine-readable)\";" > $SECRET_FILE

PUBLIC="$(fastd -c ${SECRET_FILE} --show-key --machine-readable)"

echo "key \"${PUBLIC}\";" > $PEER_NAME

cat $SECRET_FILE
cat $PEER_NAME

rm $SECRET_FILE

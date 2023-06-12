#!/bin/bash
set -e

if [ "$MONGO_INITDB_ROOT_USERNAME" ] && [ "$MONGO_INITDB_ROOT_PASSWORD" ]; then
    "${mongo[@]}" -u "$MONGO_INITDB_ROOT_USERNAME" -p "$MONGO_INITDB_ROOT_PASSWORD" --authenticationDatabase "$rootAuthDatabase" "$@" <<EOJS
        rs.initiate({
            _id: "rs0",
            version: 1,
            members: [
                { _id: 0, host : "localhost:27017" },
                { _id: 1, host : "localhost:27018" },
                { _id: 2, host : "localhost:27019" }
            ]
        })
EOJS
fi

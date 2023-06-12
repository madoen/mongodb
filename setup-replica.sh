#!/bin/bash
set -e

mongo -u $MONGO_INITDB_ROOT_USERNAME -p $MONGO_INITDB_ROOT_PASSWORD <<EOF
  var cfg = {
    "_id": "rs0",
    "members": [
      {
        "_id": 0,
        "host": "localhost:27017"
      }
    ]
  };
  rs.initiate(cfg, { force: true });
  rs.reconfig(cfg, { force: true });
EOF

#!/bin/bash

PARAM=""
if [ -n "$SERVERS" ]; then
    PARAM="-server -bootstrap-expect $SERVERS";
fi

consul agent -data-dir /tmp/consul $PARAM
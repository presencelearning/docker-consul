#!/bin/bash

PARAM=""
if [ -n "$SERVER" ]; then
    PARAM="-server -bootstrap-expect 1";
fi

consul agent -data-dir /tmp/consul $PARAM
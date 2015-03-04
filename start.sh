#!/bin/bash

PARAM=""
if [ -n "$SERVERS" ]; then
    PARAM="-server -bootstrap-expect $SERVERS -ui-dir /opt/consul_ui/dist";
fi

consul agent -data-dir /tmp/consul -client 0.0.0.0 $PARAM $@

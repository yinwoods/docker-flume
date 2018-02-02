#!/bin/bash

FLUME_CONF_DIR=/opt/flume/conf

cd /opt/flume \
    && ./bin/flume-ng agent \
        -n agent \
        -c ${FLUME_CONF_DIR} \
        -f ${FLUME_CONF_DIR}/flume.conf \
        -Dflume.root.logger=INFO,console

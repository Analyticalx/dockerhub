#!/bin/bash

/opt/zeppelin/bin/zeppelin-daemon.sh start

# keep container running
tail -f /dev/null
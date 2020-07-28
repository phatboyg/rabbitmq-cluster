#!/bin/bash

set -e

# Start RMQ from entry point.
# This will ensure that environment variables passed
# will be honored
/usr/local/bin/docker-entrypoint.sh rabbitmq-server -detached

sleep 2s

# Do the cluster dance
rabbitmqctl stop_app
rabbitmqctl join_cluster rabbit@rabbit1

# Stop the entire RMQ server. This is done so that we
# can attach to it again, but without the -detached flag
# making it run in the foreground
rabbitmqctl stop

# Wait a while for the application to really stop
sleep 2s

# Start it
rabbitmq-server
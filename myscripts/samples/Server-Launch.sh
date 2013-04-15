#!/bin/bash -e

SERVER="747399003"

curl -i -H X_API_VERSION:1.5 -b ~/mycookie -X POST \
https://us-3.rightscale.com/api/servers/$SERVER/launch.xml


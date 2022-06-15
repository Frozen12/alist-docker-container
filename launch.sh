#!/bin/sh
# If config file not exist, copy default config file to there
if [[ ! -f /alist/alist/conf.yml ]]; then
  cp /alist/files/* /alist/alist/
fi

# Run
./alist

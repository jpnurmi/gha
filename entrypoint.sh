#!/bin/bash
set -e

if [[ "$(uname -m)" != "x86_64" ]]; then
    sudo mkdir -p /__e/node20/bin
    sudo ln -s /usr/bin/node /__e/node20/bin/node
    sudo ln -s /usr/bin/npm /__e/node20/bin/npm
    sudo sed -i 's/ID=alpine/ID=unknown/' /etc/os-release
fi

exec "$@"

#!/bin/bash

# This script is used to login to docker hub, username und password will be read from .env file wich is located in the root directory of this project

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
env_file="$script_dir/.env"

if [ -f "$env_file" ]; then
   source "$env_file"
echo "Start container"
    docker pull $DOCKER_IMAGE_NAME
    docker run -d -p 80:3000 $DOCKER_IMAGE_NAME
else
    echo "Error: .env file not found in the script directory."
fi

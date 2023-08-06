#!/bin/bash

# This script is used to login to docker hub, username und password will be read from .env file wich is located in the root directory of this project
echo "Login to docker hub"
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
env_file="$script_dir/.env"

if [ -f "$env_file" ]; then
   source "$env_file"
    echo "Login to docker hub done"
    docker login -u "$DOCKER_USERNAME" -p "$DOCKER_PASSWORD"
else
    echo "Error: .env file not found in the script directory."
fi



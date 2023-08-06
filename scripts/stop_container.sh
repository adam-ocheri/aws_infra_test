#!/bin/bash

# This script is used to stopp all running docker container
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
echo "All container are stopped and removed"
```

```bash

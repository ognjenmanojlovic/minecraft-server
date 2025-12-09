#!/bin/bash
set -e

# Default values if not provided via environment
: "${MC_MEMORY:=1024M}"
: "${EULA:=FALSE}"

echo "Using MC_MEMORY=${MC_MEMORY}"
echo "EULA=${EULA}"

if [ "${EULA}" != "TRUE" ]; then
  echo "You must accept the Minecraft EULA by setting EULA=TRUE"
  echo "Exiting..."
  exit 1
fi

# Write EULA file
echo "eula=true" > eula.txt

echo "Starting Minecraft server with ${MC_MEMORY} memory..."
java -Xmx${MC_MEMORY} -Xms${MC_MEMORY} -jar server.jar nogui

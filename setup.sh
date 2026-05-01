#!/bin/bash

# PlanetSignal VPN Setup Script
echo "Initializing PlanetSignal VPN..."

# Update system
sudo apt-get update && sudo apt-get upgrade -y

# Install Docker if not present
if ! [ -x "$(command -v docker)" ]; then
  echo "Installing Docker..."
  curl -fsSL https://get.docker.com -o get-docker.sh
  sh get-docker.sh
fi

# Launch the VPN
sudo docker compose up -d

echo "------------------------------------------------"
echo "PlanetSignal is now LIVE."
echo "Your config files are in the ./config folder."
echo "Scan the QR codes in the logs to connect."
echo "------------------------------------------------"

# Show the first QR code for your phone
sudo docker exec -it planetsignal /app/show-peer 1


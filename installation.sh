#!/bin/bash

# Exit on error
set -e

# Step 1: Uninstall conflicting packages
echo "Removing conflicting packages..."
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do
  sudo apt-get remove -y $pkg || true
done

echo "Installing dependencies..."
sudo apt-get update
sudo apt-get install -y ca-certificates curl

# Step 2: Add Docker GPG key and repository. The commands are copied from the official Docker installation guide
echo "Adding Docker GPG key and repository..."
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \n$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Step 3: Install Docker
echo "Installing Docker..."
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Verify installation
echo "Verifying Docker installation..."
sudo docker run hello-world

# Step 4: Clone the project repository
echo "Cloning project repository..."

PROJECT_DIR=$(basename "$REPO_URL" .git)
if [ -d "$PROJECT_DIR" ]; then
  echo "Project directory already exists. Pulling latest changes..."
  cd "$PROJECT_DIR"
  git pull
else
  git clone https://github.com/AnisaaE/Linux-network-management--Docker--Add-Prodicts.git
  cd "$PROJECT_DIR"
fi

# Step 5: Run the project with Docker Compose
echo "Starting the project with Docker Compose..."
sudo docker-compose up -d

# Completion message
echo "Setup complete. The project is running."
echo "Frontend running at http://localhost:3000"
echo "Backend running at http://localhost:80"
#!/bin/bash

# Run system update
apt-get update

# install curl
apt install curl -y

# install tar
apt install tar -y


# Github Hosted Runner
# Create a folder
mkdir actions-runner && cd actions-runner
# Download the latest runner package
curl -o actions-runner-linux-x64-2.316.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.316.0/actions-runner-linux-x64-2.316.0.tar.gz
# Optional: Validate the hash
echo "9e883d210df8c6028aff475475a457d380353f9d01877d51cc01a17b2a91161d  actions-runner-linux-x64-2.316.0.tar.gz" | shasum -a 256 -c
# Extract the installer
tar xzf ./actions-runner-linux-x64-2.316.0.tar.gz

# Create the runner and start the configuration experience
export RUNNER_ALLOW_RUNASROOT="1"
export SERVERNAME="MERN-deploy"
./config.sh --url https://github.com/TitoDuarte/PROY_MERN --token AOO4XR53EWSN73N43FBZMQLGMEWQ6 --name webserver-$(echo $SERVERNAME) --labels $(echo $SERVERNAME) --unattended
# Last step, run it!
nohup ./run.sh > /dev/null 2>&1 &
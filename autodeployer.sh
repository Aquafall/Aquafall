#!/bin/bash
# Load config
source ./autodeploy.conf

if [ ! -d "$DEPLOY_DIR" ]; then
    echo "Deployment directory does not exist. Creating it now."
    mkdir -p "$DEPLOY_DIR"
fi

git pull origin main
if [ $? -ne 0 ]; then
    echo "Failed to pull the latest changes from the repository."
    exit 1
fi
yarn
if [ $? -ne 0 ]; then
    echo "Failed to install dependencies using yarn."
    exit 1
fi
yarn build
if [ $? -ne 0 ]; then
    echo "Failed to build the project using yarn."
    exit 1
fi

rm -rf "$DEPLOY_DIR"/*
echo "Deployment directory cleaned."
echo "Copying build files to the deployment directory..."
cp -r build/* "$DEPLOY_DIR"
if [ $? -ne 0 ]; then
    echo "Failed to copy build files to the deployment directory."
    exit 1
fi
echo "Deployment completed successfully."

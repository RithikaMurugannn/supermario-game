#!/bin/bash

ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)
REGION=eu-west-1
REPO=supermario

aws ecr create-repository --repository-name $REPO || true

aws ecr get-login-password --region eu-west-1 \
| docker login --username AWS \
--password-stdin rithika17.dkr.ecr.eu-west-1.amazonaws.com

docker build -t mario:latest
docker tag mario rithika17/mario:latest
docker push rithika17/mario:latest


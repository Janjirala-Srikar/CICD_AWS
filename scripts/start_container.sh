#!/bin/bash

ACCOUNT_ID=824267125510
REGION=us-east-1
IMAGE=demo/sample-python:latest

aws ecr get-login-password --region $REGION | docker login --username AWS --password-stdin $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com

docker pull $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$IMAGE

docker run -d -p 80:5000 --name simple-python $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$IMAGE

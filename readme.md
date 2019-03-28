# Steps to get running

Follow these instructions, and set a new password where it says "setANewPasswordHere":
1. Install Docker
2. Start and run the container: $ docker container run --detach --name splunk-docker --interactive --tty --publish 8000:8000 --env SPLUNK_PASSWORD="setANewPasswordHere" pdreeves/splunk-docker
3. Log in at http://localhost:8000 with the username admin, and password set in step 2
4. (optional) Assign a license to Splunk

By default Splunk will use the 60-day trial license, but a production or dev licensed can be assigned through the UI.

# Container Operation Commands
## Create and start new container
docker container run --detach --name splunk-docker --interactive --tty --publish 8000:8000 --env SPLUNK_PASSWORD="newSplunkPassword" pdreeves/splunk-docker

## Start existing container
docker container start splunk-docker

## Stop container
docker container stop splunk-docker

## Delete container
docker container rm splunk-docker

## Delete image
docker image rm pdreeves/splunk-docker

## Enter shell session in to container
docker container exec --tty --interactive splunk-docker /bin/bash

# Container Build Commands
## Build image
docker image build . --file Dockerfile --tag splunk-docker

## Start and run container
docker container run --detach --name splunk-docker --interactive --tty --publish 8000:8000 --env SPLUNK_PASSWORD="newSplunkPassword" splunk-docker

## Delete image
docker image rm splunk-docker

## Enter shell session in to container
docker container exec --tty --interactive splunk-docker /bin/bash

[![Build Status](https://travis-ci.org/panfio/services-ci.svg?branch=master)](https://travis-ci.org/panfio/services-ci)

For run app locally clone `git clone https://github.com/panfio/services-ci` and build the project `sudo docker-compose up --build`
Open [http://localhost:7777](http://localhost:7777) to view it in the browser.

## CI
Log in to travis-ci.org enable your repo and set credentials for hub.docker.com in settings section:
`DOCKER_ID` and `DOCKER_PASSWORD`
Now images are sent to your Docker-Hub repository.

ARG MAINTAINER=maintainer
ARG VERSION=version

FROM node:14.14.0-stretch

# Add the following metadata to the image as labels
LABEL MAINTAINER=${MAINTAINER:-"Chris Perkins"} VERSION=${VERSION:-"latest"}

# This image is used only for initialising the project and
# generating the inital project structure and files

# Create app directory
WORKDIR /usr/src/app

# ****** Do not Install app dependencies using package.json in this Dockerfile ****** #
# This image serves as an un opinionated blanc canvas
# allowing team members to use a variety of methods to install
# dependancies and generate project files.

VOLUME /usr/src/app

EXPOSE 8080

CMD [ "node", "server.js" ]
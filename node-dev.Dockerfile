FROM node:14.14.0-stretch

ARG VERSION
ARG PROJECT_NAME

ENV MAINTAINER "Chris Perkins"

# Add the following metadata to the image as labels
LABEL MAINTAINER=${MAINTAINER:-"Chris Perkins"} VERSION=${VERSION:-"latest"}

# This image is used only for Developing applications locally, so we
# add the following packages to help with managing and serving
# applications within the container.
# Install express-generator
RUN npm install live-server -g

# Create app directory
WORKDIR /usr/src/${PROJECT_NAME}

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY ./projects/${PROJECT_NAME} /usr/src/${PROJECT_NAME}

# Make sure any dependancies are installed and the application code
# base is generated.
RUN npm install --save-dev webpack && \
    npm install --save-dev webpack-dev-server && \
    npm install


VOLUME /usr/src/${PROJECT_NAME}

EXPOSE 8080

CMD [ "node", "server.js" ]
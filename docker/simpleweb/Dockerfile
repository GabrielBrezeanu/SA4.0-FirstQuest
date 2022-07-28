# Specify a base image 
FROM node:14-alpine

WORKDIR /usr/app

# Install some dependenmcies
COPY ./package.json ./
RUN npm install
COPY ./ ./

# Default command
CMD ["npm", "start"]
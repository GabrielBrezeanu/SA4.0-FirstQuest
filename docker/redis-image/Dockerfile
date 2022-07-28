# Use an existing docker image as a base
FROM alpine

# Download and install a dependency

RUN apk add --update gcc
RUN apk add --update redis

# Tell the image what to do when it starts as a container

CMD ["redis-server"]

# Teardown:
# FROM, RUN, CMD -> instuction telling Docker Server what to do.
# alpine, apk add --update redis, ["redis-server"] -> argument to the instruction.

# Writing a Dockerfile == Being given a computer with no OS and being told to install Chrome.
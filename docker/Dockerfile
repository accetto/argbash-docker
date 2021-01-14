#docker build -f ./docker/Dockerfile -t accetto/argbash-docker .
#docker build -f ./docker/Dockerfile -t accetto/argbash-docker:dev .

FROM library/alpine:latest

LABEL \
	run="docker run --rm -v \"$(pwd):/work\" -u \"$(id -u):$(id -g)\" accetto/argbash-docker my-template.m4 -o my-script.sh" \
	help="docker run --rm accetto/argbash-docker -h" \
	version="@VERSION@" \
	vendor="https://github.com/accetto" \
	release="1" \
	build-date="@NOW@" \
	summary="The ready-to-use argbash argument parsing code generator" \
	description="Argbash is a code generator that generates an argument-parsing bash library tailor-made for your script. It lets you to describe arguments your script should take and then, you can generate the bash parsing code, or other outputs from it. Argbash is very simple to use and the generated code is relatively nice to read. Find out how to efficiently use it at https://argbash.readthedocs.io/" \
	URL="https://hub.docker.com/r/accetto/argbash-docker/" \
	vcs-url="https://github.com/accetto/argbash-docker" \
	name="accetto/argbash-docker"

ENV PROGRAM=argbash

# The application requires bash to run.
# and coreutils for readlink
RUN apk add --no-cache autoconf bash

# Install argbash from sources
### @accetto: original content from @matejak
# COPY    argbash/ /usr/src/argbash/
# COPY    entrypoint.sh /
### @accetto: supporting auto-build on Docker Hub
COPY [ ".", "/usr/src/argbash/" ]
COPY [ "./docker/entrypoint.sh", "/" ]

WORKDIR /usr/src/argbash/resources/
RUN	apk add --no-cache --virtual .build-dependencies \
    	make \
     && make install PREFIX=/usr/local \
     && apk del .build-dependencies

# This is the workspace for exec commands
WORKDIR /work

# Run argbash with any default invocation.
ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "" ]

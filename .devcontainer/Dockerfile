FROM 6214247/data-lab:latest

# install git and other tools

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends git openssh-client less iproute2 procps lsb-release \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/*

RUN echo "Hello World!"

RUN echo "I am building up your code environment now..."

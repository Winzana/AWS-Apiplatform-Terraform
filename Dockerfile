FROM docker:latest

RUN apk update && apk add --no-cache \
        git \
        build-base \
        libffi-dev \
        libc-dev \
        make \
        openssl-dev \
        py-pip \
        python \
        python-dev \
        openssh-client \
        jq \
        py-pip \
        unzip \
        wget \
    && pip install docker-compose \
    && pip install awscli
   
RUN mkdir -p /opt/bin && \
    cd /opt/bin && \ 
    wget https://releases.hashicorp.com/terraform/0.12.7/terraform_0.12.7_linux_amd64.zip && \ 
    unzip terraform_0.12.7_linux_amd64.zip &&  \
    chmod 750 /opt/bin/terraform && \
    cd /usr/local/bin && \
    ln -s /opt/bin/terraform terraform

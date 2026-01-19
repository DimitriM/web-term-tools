FROM alpine:3

# Whenever possible, install tools using the distro package manager
RUN apk add --no-cache \
    tini \ 
    ttyd \
    ca-certificates \
    coreutils \
    curl \
    bind-tools \
    busybox-extras \
    diffutils \
    lftp \
    git \
    gnupg \
    grep \
    ipmitool \
    iproute2 \
    iputils-arping \
    iputils-ping \
    jq \
    less \
    mawk \
    nano \
    net-tools \
    netcat-openbsd \
    nmap \
    openssh-client \
    openssl \
    procps \
    rsync \
    sed \
    socat \
    traceroute \
    util-linux \
    wget \
    zip \
    unzip \
    gzip \
    pigz \
    bzip2 \
    pixz \
    zstd \
    mariadb-client \
    postgresql-client \
    redis

# Configure a nice terminal
RUN echo "export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '" >> /etc/profile
# Fake poweroff (stops the container from the inside by sending SIGTERM to PID 1)
RUN echo "alias poweroff='kill 1'" >> /etc/profile

ENV TINI_KILL_PROCESS_GROUP=1

EXPOSE 7681
ENTRYPOINT ["/sbin/tini", "--"]
CMD [ "ttyd", "-W", "-s", "3", "-t", "titleFixed=/bin/sh", "-t", "rendererType=webgl", "-t", "disableLeaveAlert=true", "/bin/sh", "-i", "-l" ]

FROM kalilinux/kali-rolling
LABEL maintainer="Jack21"

ENV HOME /root
ENV DEBIAN_FRONTEND=noninteractive

#Working Directory
WORKDIR /root
RUN mkdir ${HOME}/toolkit && \
    mkdir /work && \
    mkdir ${HOME}/wordlists && \
    mkdir -p ${HOME}/scripts/Enumeration && \ 
    mkdir ${HOME}/scripts/PrivEsc && \ 
    mkdir ${HOME}/scripts/Web



# Install Essentials
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    tmux \
    gcc \
    iputils-ping\
    git \
    vim \
    wget \
    awscli \
    tzdata \
    curl \
    make \
    nmap \
    whois \
    python2 \
    python3-venv \    
    # python-pip \
    python3 \
    python3-pip \
    perl \
    nikto \
    dnsutils \
    net-tools \
    neovim\
    zsh\
    nano\
    libzip-dev \ 
    nodejs \
    npm \
    pkg-config \
    openssh-client \
    rlwrap \
    && rm -rf /var/lib/apt/lists/*

#Install Dependencies 
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    # sqlmap
    sqlmap \
    # wfuzz
    #python-pycurl \
    # dnsenum
    cpanminus \
    # wpcscan
    libcurl4-openssl-dev \
    libxml2 \
    libxml2-dev \
    libxslt1-dev \
    ruby-dev \
    libgmp-dev \
    zlib1g-dev \
    # dnsrecon
    dnsrecon \
    #crackmapexe
    libssl-dev \
    libffi-dev\
    python-dev \ 
    build-essential \
    #netcat
    netcat \
    #enum4linux 
    enum4linux \
    #dnsenum
    dnsenum \
    #hashcat
    hashcat \
    #JohnTheRipper
    john \
    # hash-identifier
    hash-identifier \
    # hydra
    hydra \
    #tcpdump 
    tcpdump \ 
    #openvpn
    openvpn \
    && rm -rf /var/lib/apt/lists/*

# wfuzz
#RUN pip install wfuzz


    # configure python(s)
RUN python3 -m pip install --upgrade setuptools && python3 -m pip install --upgrade setuptools

# wpscan
RUN cd ${HOME}/toolkit && \
    git clone https://github.com/wpscanteam/wpscan.git && \
    cd wpscan/ && \
    gem install bundler && bundle install --without test && \
    gem install wpscan

# go
RUN cd /opt && \
    wget https://dl.google.com/go/go1.13.3.linux-amd64.tar.gz && \
    tar -xvf go1.13.3.linux-amd64.tar.gz && \
    rm -rf /opt/go1.13.3.linux-amd64.tar.gz && \
    mv go /usr/local 
ENV GOROOT /usr/local/go
ENV GOPATH /root/go
ENV PATH ${GOPATH}/bin:${GOROOT}/bin:${PATH}

# dirsearch
RUN cd ${HOME}/toolkit && \
    git clone https://github.com/AlexisAhmed/dirsearch.git && \
    cd dirsearch && \
    chmod +x dirsearch.py && \
    ln -sf ${HOME}/toolkit/dirsearch/dirsearch.py /usr/local/bin/dirsearch

# ffuf 
RUN go get github.com/ffuf/ffuf
# Last Confi 
#cd /opt && \
#    wget https://github.com/ffuf/ffuf/releases/download/v1.0.2/ffuf_1.0.2_linux_arm64.tar.gz && \
#    tar -xvf ffuf_1.0.2_linux_arm64.tar.gz && \
#    rm -rf ffuf_1.0.2_linux_arm64.tar.gz && \
#    chmod +x ffuf && \
#    ln -sf /opt/ffuf /usr/local/bin/ffuf

# zsh 

RUN wget https://raw.githubusercontent.com/internetghost2/PcConfig/master/LABS/docker/config/zsh/.zshrc && \
    chsh -s /bin/zsh && \
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.zsh-syntax-highlighting" --depth 1 && \
    echo "source $HOME/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> "$HOME/.zshrc"

# whatweb
RUN cd ${HOME}/toolkit && \
    git clone https://github.com/urbanadventurer/WhatWeb.git && \
    cd WhatWeb && \
    chmod +x whatweb && \
    ln -sf ${HOME}/toolkit/WhatWeb/whatweb /usr/local/bin/whatweb

# Crackmapexe
RUN python3 -m pip install pipx && \
    python3 -m pipx ensurepath && \
    python3 -m pip install virtualenv && \
    python3 -m pipx install crackmapexec

#r2frida

RUN git clone https://github.com/radareorg/radare2.git /opt/radare2 && \ 
    cd /opt/radare2 && \
    sys/install.sh && \
    r2pm init && \ 
    r2pm -ci r2frida

#evil-winrm
RUN gem install evil-winrm


# JohnTheRipper
RUN git clone https://github.com/magnumripper/JohnTheRipper.git "${HOME}/toolkit/JohnTheRipper"
ENV PATH ${HOME}/toolkit/JohnTheRipper/run:${PATH}

# Download wordlist
# SecList
RUN cd ${HOME}/wordlists && \
    git clone --depth 1 https://github.com/danielmiessler/SecLists.git && \
    tar -zxvf  SecLists/Passwords/Leaked-Databases/rockyou.txt.tar.gz


# Donwload scripts 
# LinEnum
# RUN wget https://raw.githubusercontent.com/rebootuser/LinEnum/master/LinEnum.sh -o ${HOME}/scripts/Enumeration/LinEnum.sh && \
#    rm LinEnum.sh

# pspy64 - big
#COPY config/scripts/pspy64 ${HOME}/scripts/Enumeration/pspy64

# php-reverse-shell
# RUN wget https://raw.githubusercontent.com/pentestmonkey/php-reverse-shell/master/php-reverse-shell.php -o scripts/Web/php-reverse-shell.php && \
#    rm php-reverse-shell.php
# simple-php-shell

# RUN wget https://raw.githubusercontent.com/artyuum/Simple-PHP-Web-Shell/master/index.php -o scripts/Web/simple-webshell.php && \
#    rm index.php

# Simple Backdoor 
# RUN echo '<?php system($_GET['cmd']); ?>' > scripts/Web/basic-shell.php


#Nvim like vscode



# Add alias
RUN echo -n "\n\n#Alias\n" >> .zshrc && \
    echo 'alias ll="ls -l"' >> .zshrc && \
    echo 'alias la="ls -a"' >> .zshrc && \
    echo 'alias lla="ls -la"' >> .zshrc && \
    echo 'alias cme="cracmapexe"' >> .zshrc 

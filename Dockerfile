FROM myoung34/github-runner:latest@sha256:cbf192a95a6a9e38287fd8635cd68b303a4143b46937c09d85d8dc22f3c0b2b2

ENV NODE_VERSION=22.3.0
ENV NVM_VERSION=0.39.7
ENV PWSH_VERSION=7.4.3
ENV OP_VERSION=2.29.0


RUN apt update \
    && apt install software-properties-common -y \
    && add-apt-repository ppa:git-core/ppa \
    && apt update \
    && apt install unzip wget curl tree sudo git netcat lsof -y
ENV NVM_DIR=/root/.nvm
ENV DOTNET_ROOT "/usr/share/dotnet"
ENV PATH "$DOTNET_ROOT:$DOTNET_ROOT/tools:${NVM_DIR}/:${NVM_DIR}/versions/node/v${NODE_VERSION}/bin/:$PATH"

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v${NVM_VERSION}/install.sh | bash \
    && . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION} \
    && . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION} \
    && . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION} \
    && node --version && npm --version && npx --version

RUN curl -sL https://aka.ms/InstallAzureCliDeb | sudo bash \
    && curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --channel 6.0 --install-dir ${DOTNET_ROOT} \
    && curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --channel 7.0 --install-dir ${DOTNET_ROOT} \
    && curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --channel 8.0 --install-dir ${DOTNET_ROOT} \
    && dotnet tool install --global PowerShell \
    && dotnet workload install aspire

RUN ARCH="amd64" \
    && wget "https://cache.agilebits.com/dist/1P/op2/pkg/v$OP_VERSION/op_linux_${ARCH}_v$OP_VERSION.zip" -O op.zip \
    && unzip -d op op.zip \
    && mv op/op /usr/local/bin \
    && rm -r op.zip op \
    && groupadd -f onepassword-cli \
    && chgrp onepassword-cli /usr/local/bin/op \
    && chmod g+s /usr/local/bin/op

ENV NUGET_PACKAGES "/nuget"

#RUN echo 'export DOTNET_ROOT=/usr/share/dotnet' >> ~/.bashrc
#RUN echo 'export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools' >> ~/.bashrc

ENTRYPOINT ["/entrypoint.sh"]
CMD ["./bin/Runner.Listener", "run", "--startuptype", "service"]

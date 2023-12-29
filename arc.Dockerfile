FROM ghcr.io/actions/actions-runner:latest
ENV NODE_VERSION=20.9.0
ENV NVM_VERSION=0.39.5
ENV PWSH_VERSION=7.3.9

RUN apt install curl -y

RUN apt install curl tree -y \
    && curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash \
    && curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --channel 6.0 --install-dir /usr/share/dotnet \
    && curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --channel 7.0 --install-dir /usr/share/dotnet \
    && curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --channel 8.0 --install-dir /usr/share/dotnet

ENV NVM_DIR=/root/.nvm
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v${NVM_VERSION}/install.sh | bash \
    && . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION} \
    && . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION} \
    && . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION} \
    && node --version && npm --version && npx --version \
    && dotnet tool install --global PowerShell

RUN ARCH="amd64" \
    && wget "https://cache.agilebits.com/dist/1P/op2/pkg/v2.24.0/op_linux_${ARCH}_v2.24.0.zip" -O op.zip \
    && unzip -d op op.zip \
    && sudo mv op/op /usr/local/bin \
    && rm -r op.zip op \
    && sudo groupadd -f onepassword-cli \
    && sudo chgrp onepassword-cli /usr/local/bin/op \
    && sudo chmod g+s /usr/local/bin/op

ENV DOTNET_ROOT "/usr/share/dotnet"
ENV PATH "$DOTNET_ROOT:$DOTNET_ROOT/tools:/root/.nvm/:/root/.nvm/versions/node/v${NODE_VERSION}/bin/:$PATH"
ENV NUGET_PACKAGES "/nuget"

#RUN echo 'export DOTNET_ROOT=/usr/share/dotnet' >> ~/.bashrc
#RUN echo 'export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools' >> ~/.bashrc


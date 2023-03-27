FROM myoung34/github-runner:latest

RUN curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash \
    && curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --channel LTS --install-dir /usr/share/dotnet \
    && curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --channel STS --install-dir /usr/share/dotnet \
    && apt install tree -y
ENV NODE_VERSION=18.15.0
ENV NVM_DIR=/root/.nvm
RUN apt install -y curl \
    && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash \
    && . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION} \
    && . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION} \
    && . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION} \
    && node --version && npm --version && npx --version

ENV DOTNET_ROOT "/usr/share/dotnet"
ENV PATH "$DOTNET_ROOT:$DOTNET_ROOT/tools:/root/.nvm/:/root/.nvm/versions/node/v18.15.0/bin/:$PATH"
ENV NUGET_PACKAGES "/nuget"

#RUN echo 'export DOTNET_ROOT=/usr/share/dotnet' >> ~/.bashrc
#RUN echo 'export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools' >> ~/.bashrc

ENTRYPOINT ["/entrypoint.sh"]
CMD ["./bin/Runner.Listener", "run", "--startuptype", "service"]
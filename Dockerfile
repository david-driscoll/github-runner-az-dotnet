FROM myoung34/github-runner:latest

RUN curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
RUN curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --channel LTS
RUN curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --channel STS


ENV DOTNET_ROOT "$HOME/.dotnet"
ENV PATH "$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools"

RUN echo 'export DOTNET_ROOT=$HOME/.dotnet' >> ~/.bashrc
RUN echo 'export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools' >> ~/.bashrc

ENTRYPOINT ["/entrypoint.sh"]
CMD ["./bin/Runner.Listener", "run", "--startuptype", "service"]
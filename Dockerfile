FROM myoung34/github-runner:latest

RUN curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
RUN curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --channel LTS --install-dir /usr/share/dotnet
RUN curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --channel STS --install-dir /usr/share/dotnet


ENV DOTNET_ROOT "/usr/share/dotnet"
ENV PATH "$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools"

#RUN echo 'export DOTNET_ROOT=/usr/share/dotnet' >> ~/.bashrc
#RUN echo 'export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools' >> ~/.bashrc

ENTRYPOINT ["/entrypoint.sh"]
CMD ["./bin/Runner.Listener", "run", "--startuptype", "service"]
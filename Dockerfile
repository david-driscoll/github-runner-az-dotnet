FROM myoung34/github-runner:latest

RUN curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
RUN curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --channel LTS
RUN curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --channel STS

ENTRYPOINT ["/entrypoint.sh"]
CMD ["./bin/Runner.Listener", "run", "--startuptype", "service"]
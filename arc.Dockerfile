FROM mcr.microsoft.com/dotnet/runtime-deps:6.0-jammy as build

ARG TARGETOS="linux"
ARG TARGETARCH="amd64"

# renovate: datasource=github-releases depName=runner packageName=actions/runner
ARG RUNNER_VERSION=2.317.0
ARG RUNNER_ARCH="x64"
# renovate: datasource=github-releases depName=actions/runner-container-hooks packageName=actions/runner-container-hooks
ARG RUNNER_CONTAINER_HOOKS_VERSION=0.6.1
# renovate: datasource=docker packageName=docker versioning=docker
ARG DOCKER_VERSION=27.1.1
# renovate: datasource=github-releases depName=buildx packageName=docker/buildx
ARG BUILDX_VERSION=0.16.0

RUN apt update -y && apt install curl unzip -y

WORKDIR /actions-runner
RUN export RUNNER_ARCH=${TARGETARCH} \
    && if [ "$RUNNER_ARCH" = "amd64" ]; then export RUNNER_ARCH=x64 ; fi \
    && curl -f -L -o runner.tar.gz https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-${TARGETOS}-${RUNNER_ARCH}-${RUNNER_VERSION}.tar.gz \
    && tar xzf ./runner.tar.gz \
    && rm runner.tar.gz

RUN curl -f -L -o runner-container-hooks.zip https://github.com/actions/runner-container-hooks/releases/download/v${RUNNER_CONTAINER_HOOKS_VERSION}/actions-runner-hooks-k8s-${RUNNER_CONTAINER_HOOKS_VERSION}.zip \
    && unzip ./runner-container-hooks.zip -d ./k8s \
    && rm runner-container-hooks.zip

RUN export RUNNER_ARCH=${TARGETARCH} \
    && if [ "$RUNNER_ARCH" = "amd64" ]; then export DOCKER_ARCH=x86_64 ; fi \
    && if [ "$RUNNER_ARCH" = "arm64" ]; then export DOCKER_ARCH=aarch64 ; fi \
    && curl -fLo docker.tgz https://download.docker.com/${TARGETOS}/static/stable/${DOCKER_ARCH}/docker-${DOCKER_VERSION}.tgz \
    && tar zxvf docker.tgz \
    && rm -rf docker.tgz \
    && mkdir -p /usr/local/lib/docker/cli-plugins \
    && curl -fLo /usr/local/lib/docker/cli-plugins/docker-buildx \
    "https://github.com/docker/buildx/releases/download/v${BUILDX_VERSION}/buildx-v${BUILDX_VERSION}.linux-${TARGETARCH}" \
    && chmod +x /usr/local/lib/docker/cli-plugins/docker-buildx

FROM mcr.microsoft.com/dotnet/runtime-deps:6.0-jammy

# renovate: datasource=github-tags depName=node packageName=nodejs/node versioning=node
ENV NODE_VERSION=22.4.1
# renovate: datasource=github-releases depName=nvm packageName=nvm-sh/nvm
ENV NVM_VERSION=0.39.7
# renovate: datasource=github-releases depName=powershell packageName=PowerShell/PowerShell
ENV PWSH_VERSION=7.4.3
ENV OP_VERSION=2.29.0
# renovate: datasource=github-tags depName=dotnet-sdk packageName=dotnet/sdk
ENV DOTNET_SDK_VERSION=8.0.303

ENV NVM_DIR=/home/runner/.nvm
ENV DOTNET_ROOT "/usr/share/dotnet"
ENV PATH "$DOTNET_ROOT:$DOTNET_ROOT/tools:${NVM_DIR}/:${NVM_DIR}/versions/node/v${NODE_VERSION}/bin/:$PATH"

RUN apt update \
    && apt install software-properties-common -y \
    && add-apt-repository ppa:git-core/ppa \
    && apt update \
    && apt install unzip wget curl tree sudo git netcat lsof -y


# WORKDIR /.temp
# COPY ./github-runner-az-dotnet.csproj ./github-runner-az-dotnet.csproj
# Copy ./.config/dotnet-tools.json ./.config/dotnet-tools.json

RUN curl -sL https://aka.ms/InstallAzureCliDeb | sudo bash \
    && curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --channel 8.0 --install-dir ${DOTNET_ROOT} --version ${DOTNET_SDK_VERSION} \
    && dotnet tool install --global PowerShell \
    && dotnet workload install aspire
    # && dotnet restore \
    # && dotnet tool restore \
    # && rm -rf /.temp

RUN ARCH="amd64" \
    && wget "https://cache.agilebits.com/dist/1P/op2/pkg/v$OP_VERSION/op_linux_${ARCH}_v$OP_VERSION.zip" -O op.zip \
    && unzip -d op op.zip \
    && mv op/op /usr/local/bin \
    && rm -r op.zip op \
    && groupadd -f onepassword-cli \
    && chgrp onepassword-cli /usr/local/bin/op \
    && chmod g+s /usr/local/bin/op \
    && op update

ENV DEBIAN_FRONTEND=noninteractive
ENV RUNNER_MANUALLY_TRAP_SIG=1
ENV ACTIONS_RUNNER_PRINT_LOG_TO_STDOUT=1
ENV ImageOS=ubuntu22

RUN apt-get update -y \
    && apt-get install -y --no-install-recommends lsb-release \
    && rm -rf /var/lib/apt/lists/*

RUN adduser --disabled-password --gecos "" --uid 1001 runner \
    && groupadd docker --gid 123 \
    && usermod -aG sudo runner \
    && usermod -aG docker runner \
    && echo "%sudo   ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers \
    && echo "Defaults env_keep += \"DEBIAN_FRONTEND\"" >> /etc/sudoers

WORKDIR /home/runner

COPY --chown=runner:docker --from=build /actions-runner .
COPY --from=build /usr/local/lib/docker/cli-plugins/docker-buildx /usr/local/lib/docker/cli-plugins/docker-buildx

RUN install -o root -g root -m 755 docker/* /usr/bin/ && rm -rf docker

USER runner

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v${NVM_VERSION}/install.sh | bash \
    && . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION} \
    && . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION} \
    && . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION} \
    && node --version && npm --version && npx --version

ARG LIBERICA_TAG

FROM bellsoft/liberica-openjdk-debian:$LIBERICA_TAG

RUN apt update && \
    apt install --no-install-recommends -y curl unzip groff docker.io

RUN ARCH=$(dpkg --print-architecture); \
    case "$ARCH" in \
        amd64) AWS_CLI_ARCH=x86_64 ;; \
        arm64) AWS_CLI_ARCH=aarch64 ;; \
        *) echo "Unsupported architecture: $ARCH"; exit 1 ;; \
    esac; \
    AWS_CLI_URL="https://awscli.amazonaws.com/awscli-exe-linux-${AWS_CLI_ARCH}.zip"; \
    curl "${AWS_CLI_URL}" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install

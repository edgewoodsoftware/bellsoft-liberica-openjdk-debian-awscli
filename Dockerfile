FROM bellsoft/liberica-openjdk-debian:21.0.1

RUN apt update && \
    apt install --no-install-recommends -y curl unzip groff docker.io && \
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install

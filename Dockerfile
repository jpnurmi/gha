# docker build --build-arg BASE=alpine:3.21
ARG BASE=alpine:latest
FROM ${BASE}

RUN apk update
RUN apk add bash build-base clang cmake curl file git icu lsb-release-minimal powershell sudo tar tree wget
RUN pwsh -Command Install-Module Pester -Scope AllUsers -Force

RUN addgroup runner
RUN adduser -S -u 1001 -h /home/runner -G runner runner
RUN mkdir -p /home/runner /__e /__w /__w/_temp /__w/_actions /__w/_tool
RUN chown -R runner:runner /home/runner /__e /__w
RUN ln -s /__w /home/runner/work
RUN echo "runner ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/runner
RUN chmod 0440 /etc/sudoers.d/runner
RUN chmod -R 777 /opt
RUN chmod -R 777 /usr/share
USER runner
WORKDIR /__w
ENTRYPOINT ["/bin/bash"]

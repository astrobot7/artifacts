# Sandboxed SSH host for OpenIDEA remote development (github.com/l0ng-ai/openidea). The desktop
# app SSHes in, uploads openidea-server to ~/.openidea/server/ and runs it as `--stdio`; this image
# only provides sshd and a dev userland. Everything runs as uid 1000 (`dev`, home /home/dev): sshd
# listens on 2222 unprivileged, so the pod needs no root and no capabilities, and the root
# filesystem can be read-only. sshd_config and authorized_keys are mounted at /etc/openidea/.
# The ed25519 host key is created on first start in ~/.ssh-host (keep $HOME on a volume).
# PLATFORMS=linux/amd64,linux/arm64
FROM debian:trixie-slim@sha256:a72b4433de1cf7d6bae0c4cee74d0547f58601a643b3375f070c51600d63b6b2
ARG VERSION=1
RUN set -eu; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      openssh-server openssh-sftp-server ca-certificates curl git gzip findutils procps less \
      vim-tiny unzip xz-utils make build-essential; \
    rm -rf /var/lib/apt/lists/* /etc/ssh/ssh_host_*; \
    groupadd -g 1000 dev; \
    useradd -u 1000 -g 1000 -m -d /home/dev -s /bin/bash dev; \
    mkdir -p /run/sshd /etc/openidea
COPY --chmod=755 entrypoint.sh /usr/local/bin/entrypoint.sh
USER 1000:1000
WORKDIR /home/dev
EXPOSE 2222
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

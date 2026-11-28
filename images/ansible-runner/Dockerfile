# Runner for the homelab node upgrades (astrobot7/docker-compose: ansible/upgrade.yml, Jobs
# created by n8n in k8s/pandora/system-upgrade). ansible-core, kubectl, ssh, curl and jq; no
# playbooks baked in: run-upgrade fetches the repo from Flux's source-controller at start.
# arm64 only: the Jobs run on pandora or nfs.
ARG BASE=python:3.13-slim-trixie@sha256:168d3a5d10f2152f8e8d77b6843ac82c22a846cfefeef7afdf9aa630404e82a7
FROM $BASE
# ansible-core version (also the image tag)
ARG VERSION=2.22.0
ARG KUBECTL_VERSION=v1.37.2
ARG KUBECTL_SHA256=fcc16f63186659d9722014b7e02d5fdd2d4e669cb8c0ab66365d7d3b8ba03509
SHELL ["/bin/bash", "-euo", "pipefail", "-c"]

RUN apt-get update \
 && apt-get install -y --no-install-recommends openssh-client curl jq ca-certificates \
 && rm -rf /var/lib/apt/lists/* \
 && curl -fsSL -o /usr/local/bin/kubectl "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/arm64/kubectl" \
 && echo "${KUBECTL_SHA256}  /usr/local/bin/kubectl" | sha256sum -c - \
 && chmod 0755 /usr/local/bin/kubectl \
 && pip install --no-cache-dir "ansible-core==${VERSION}" \
 && useradd --uid 1000 --create-home runner

COPY --chmod=0755 run-upgrade /usr/local/bin/run-upgrade
USER 1000
WORKDIR /home/runner
ENTRYPOINT ["run-upgrade"]

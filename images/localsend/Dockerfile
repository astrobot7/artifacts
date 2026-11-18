# LocalSend receiver: the community Go CLI (github.com/0w0mewo/localsend-cli), which accepts every
# incoming transfer into --dir. The official CLI (LocalSend 1.18+) asks Y/N per transfer unless the
# sender is paired, so it can't run unattended. Upstream is deprecated; releases are static binaries.
#   localsend recv --devname <name> --dir /data
# Needs host networking for multicast discovery (224.0.0.167:53317) and a writable /tmp (TLS cert).
# PLATFORMS=linux/amd64,linux/arm64
ARG BASE=gcr.io/distroless/static-debian12:nonroot@sha256:afa5c872c891853ca7fcf1f12c3edb23f7eeef36189728842dd51042ff57f7ab

FROM --platform=$BUILDPLATFORM alpine:3.22@sha256:49340b346798875b5592e5d420241f2f9cfba5f47e62ebb1446a1b34734e898f AS fetch
ARG VERSION=0.0.8
ARG SHA256_amd64=4fc8a6c88ff9ae62a5c6bdc2122cf77467641a0cc4060d03e9f14b78e9b5e203
ARG SHA256_arm64=345b006b75f196e6e1ea5e5c742c02a0dd7b3a8c97734a5a99a74ca58a3d8040
ARG TARGETARCH
RUN set -eu; \
    wget -qO /ls.tgz "https://github.com/0w0mewo/localsend-cli/releases/download/v${VERSION}/localsend-v${VERSION}-linux-${TARGETARCH}.tar.gz"; \
    eval "sum=\$SHA256_${TARGETARCH}"; \
    echo "${sum}  /ls.tgz" | sha256sum -c -; \
    tar -xzf /ls.tgz -C / localsend

FROM $BASE
COPY --from=fetch /localsend /usr/local/bin/localsend
ENTRYPOINT ["/usr/local/bin/localsend"]
CMD ["recv"]

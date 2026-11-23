# psql 18 with OAuth (device flow) support: libpq-oauth isn't in Homebrew's libpq. Used to log in
# to the homelab postgres with Pocket-ID:
#   docker run --rm -it ghcr.io/astrobot7/psql "host=... user=... oauth_issuer=... oauth_client_id=..."
ARG BASE=ghcr.io/cloudnative-pg/postgresql:19-minimal-trixie@sha256:12688a494f25aa0b7e1e3cd1800abe85b427fd1a09c991668a48162e3431a2af
FROM $BASE
# Image tag; Docker tags can't hold the `+` of the package version below.
ARG VERSION=18.6-1
ARG PKG_VERSION=18.6-1.pgdg13+2
USER root
RUN apt-get update \
 && apt-get install -y --no-install-recommends "libpq-oauth=${PKG_VERSION}" \
 && rm -rf /var/lib/apt/lists/*
USER 26
ENTRYPOINT ["psql"]

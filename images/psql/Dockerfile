# psql 18 with OAuth (device flow) support: libpq-oauth isn't in Homebrew's libpq. Used to log in
# to the homelab postgres with Pocket-ID:
#   docker run --rm -it ghcr.io/astrobot7/psql "host=... user=... oauth_issuer=... oauth_client_id=..."
ARG BASE=ghcr.io/cloudnative-pg/postgresql:18-minimal-trixie@sha256:c8caac9817d2b5e5e66297a3ccf86d9fcbd68f097aa6cc00161d83f9635e88cc
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

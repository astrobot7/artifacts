# psql 18 with OAuth (device flow) support: libpq-oauth isn't in Homebrew's libpq. Used to log in
# to the homelab postgres with Pocket-ID:
#   docker run --rm -it ghcr.io/astrobot7/psql "host=... user=... oauth_issuer=... oauth_client_id=..."
ARG BASE=ghcr.io/cloudnative-pg/postgresql:18-minimal-trixie@sha256:ec2ed3404e89fff99643901b58a2a34c46a46345fe69a3d96500b82f995c327b
FROM $BASE
ARG VERSION=18.6-1.pgdg13+2
USER root
RUN apt-get update \
 && apt-get install -y --no-install-recommends "libpq-oauth=${VERSION}" \
 && rm -rf /var/lib/apt/lists/*
USER 26
ENTRYPOINT ["psql"]

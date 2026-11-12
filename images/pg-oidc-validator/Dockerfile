# CNPG image-volume extension: Percona's pg_oidc_validator (PostgreSQL 18 OAuth
# validator) for the stock ghcr.io/cloudnative-pg/postgresql:18-minimal-trixie image.
# Layout: lib/ = the validator, system/ = shared libraries it needs that the base image
# lacks (libcurl and friends), loaded via `ld_library_path: [system]`. No compiling:
# Percona's Debian trixie package is installed and its files are copied out.
ARG BASE=ghcr.io/cloudnative-pg/postgresql:18-minimal-trixie@sha256:ec2ed3404e89fff99643901b58a2a34c46a46345fe69a3d96500b82f995c327b

FROM $BASE AS builder
ARG TARGETARCH
ARG VERSION=1.1.0-1
ARG SHA256_arm64=402384130bc3ce10e361215e2f6f97cd0ee60bb6b5c06c9e6d84abe107eba5b9
ARG SHA256_amd64=345793b90afd7487da55ddc6abb1b02eb5f3e0c2c8781a7ce38d41c889dbdbd4
ARG DEBIAN_FRONTEND=noninteractive
USER root
SHELL ["/bin/bash", "-euo", "pipefail", "-c"]

# Libraries already in the base image (not copied into system/)
RUN ldconfig -p | awk '{print $NF}' | grep '^/' | sort -u > /tmp/base-libs

RUN deb="percona-pg-oidc-validator18_${VERSION}.trixie_${TARGETARCH}.deb"; \
    sum_var="SHA256_${TARGETARCH}"; \
    apt-get update; \
    apt-get install -y --no-install-recommends curl ca-certificates; \
    curl -sSfL -o "/tmp/$deb" "https://repo.percona.com/ppg-18/apt/pool/main/p/percona-pg-oidc-validator18/$deb"; \
    echo "${!sum_var}  /tmp/$deb" | sha256sum -c -; \
    apt-get install -y --no-install-recommends "/tmp/$deb"

RUN so=$(dpkg -L percona-pg-oidc-validator18 | grep '/pg_oidc_validator\.so$'); \
    if ldd "$so" | grep -q 'not found'; then ldd "$so"; exit 1; fi; \
    mkdir -p /out/lib /out/system /out/licenses/percona-pg-oidc-validator18; \
    cp "$so" /out/lib/; \
    ldd "$so" | awk '$3 ~ /^\// {print $3}' | sort -u > /tmp/deps; \
    for lib in $(comm -13 /tmp/base-libs /tmp/deps); do \
      cp -aL "$lib" /out/system/; \
      pkg=$(dpkg -S "$(readlink -f "$lib")" 2>/dev/null | head -1 | cut -d: -f1 || true); \
      if [ -n "$pkg" ] && [ -f "/usr/share/doc/$pkg/copyright" ]; then \
        mkdir -p "/out/licenses/$pkg"; cp "/usr/share/doc/$pkg/copyright" "/out/licenses/$pkg/"; \
      fi; \
    done; \
    cp /usr/share/doc/percona-pg-oidc-validator18/copyright /out/licenses/percona-pg-oidc-validator18/ 2>/dev/null || true; \
    find /out -type f | sort

FROM scratch
COPY --from=builder /out/ /

# artifacts

Container images for aswinkm.dev, published to GHCR as `ghcr.io/astrobot7/<name>`.

| Image | What |
|---|---|
| [`pg-oidc-validator`](images/pg-oidc-validator/Dockerfile) | Percona's PostgreSQL 18 OAuth validator, packaged as a CloudNativePG image-volume extension |

Add an image: `images/<name>/Dockerfile` with an `ARG VERSION=...` line, and add `<name>` to the
matrix in `.github/workflows/images.yml`. PRs build it; merging to `main` pushes it.

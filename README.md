# artifacts

Container images for aswinkm.dev, published (public, arm64) to GHCR as `ghcr.io/astrobot7/<name>`.

| Image | Source | What |
|---|---|---|
| [`pg-oidc-validator`](images/pg-oidc-validator/Dockerfile) | this repo | Percona's PostgreSQL 18 OAuth validator, as a CloudNativePG image-volume extension |
| [`psql`](images/psql/Dockerfile) | this repo | psql 18 with OAuth device-flow support (`libpq-oauth`), for Pocket-ID logins to postgres |
| [`finmax-engine`](images/finmax-engine/source.env) | astrobot7/finmax (private) | FinMax recommendation engine |
| [`downloads-handler`](images/downloads-handler/source.env) | astrobot7/homelab (private) | Media downloads file browser |

Add an image as `images/<name>/Dockerfile` (with an `ARG VERSION=...` line), or as
`images/<name>/source.env` to build a Dockerfile from another repo. See
[`.github/workflows/images.yml`](.github/workflows/images.yml): PRs build what changed, `main` and an
hourly check push anything whose `sha-<commit>` tag isn't published yet. Private sources are read with
the `SOURCE_TOKEN` secret (fine-grained token, Contents: read-only on those repos).

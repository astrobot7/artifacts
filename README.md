# artifacts

Container images for aswinkm.dev, published (public, arm64) to GHCR as `ghcr.io/astrobot7/<name>`.

| Image | Source | What |
|---|---|---|
| [`pg-oidc-validator`](images/pg-oidc-validator/Dockerfile) | this repo | Percona's PostgreSQL 18 OAuth validator, as a CloudNativePG image-volume extension |
| [`psql`](images/psql/Dockerfile) | this repo | psql 18 with OAuth device-flow support (`libpq-oauth`), for Pocket-ID logins to postgres |
| [`ansible-runner`](images/ansible-runner/Dockerfile) | this repo | ansible-core, kubectl and ssh; runs the homelab's node upgrade playbook from Jobs that n8n creates |
| [`netbox`](images/netbox/Dockerfile) | this repo | NetBox (netbox-docker) with the netbox-topology-views plugin |
| [`openidea-sandbox`](images/openidea-sandbox/Dockerfile) | this repo | Debian userland with a non-root sshd on 2222: sandboxed SSH host for OpenIDEA remote development, amd64 + arm64 |
| [`localsend`](images/localsend/Dockerfile) | this repo | LocalSend receiver (community CLI, auto-accepts into `--dir`), amd64 + arm64 |
| [`finmax-engine`](images/finmax-engine/source.env) | astrobot7/finmax (private) | FinMax recommendation engine |
| [`downloads-handler`](images/downloads-handler/source.env) | astrobot7/homelab (private) | Media downloads file browser |

Add an image as `images/<name>/Dockerfile` (with an `ARG VERSION=...` line, and optionally
`# PLATFORMS=linux/amd64,linux/arm64`), or as
`images/<name>/source.env` to build a Dockerfile from another repo. See
[`.github/workflows/images.yml`](.github/workflows/images.yml): PRs build what changed, `main` and an
hourly check push anything whose `sha-<commit>` tag isn't published yet. Private sources are read with
the `SOURCE_TOKEN` secret (fine-grained token, Contents: read-only on those repos).

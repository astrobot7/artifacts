# NetBox (netbox-docker) with the netbox-topology-views and netbox-plugin-dns plugins, for the homelab NetBox on nfs
# (astrobot7/docker-compose: k8s/nfs/netbox). Plugins have to be in the image: netbox-docker
# has no runtime install. plugins.py enables them; collectstatic picks up their static files.
ARG BASE=docker.io/netboxcommunity/netbox:v4.7.6-5.1.2@sha256:b8df1ddcef0e7a1844b975f20daa0d50fc72820cddb06cb71f21b86bd83a9eb0
FROM $BASE
# <netbox>-<netbox-docker>-tv<netbox-topology-views>-dns<netbox-plugin-dns>
ARG VERSION=v4.7.5-5.1.2-tv5.0.2-dns1.7.3

COPY plugin_requirements.txt /opt/netbox/
COPY plugins.py /etc/netbox/config/plugins.py
RUN /usr/local/bin/uv pip install --require-hashes -r /opt/netbox/plugin_requirements.txt \
 && DEBUG="true" SECRET_KEY="dummyKeyWithMinimumLength-------------------------" \
    /opt/netbox/venv/bin/python /opt/netbox/netbox/manage.py collectstatic --no-input

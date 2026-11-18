# NetBox (netbox-docker) with the netbox-topology-views plugin, for the homelab NetBox on nfs
# (astrobot7/docker-compose: k8s/nfs/netbox). Plugins have to be in the image: netbox-docker
# has no runtime install. plugins.py enables them; collectstatic picks up their static files.
ARG BASE=docker.io/netboxcommunity/netbox:v4.7.5-5.1.2@sha256:a521748a89c8966565bbf7832fd01caef2a122f46a21ccf7a7b7682dd3428839
FROM $BASE
# <netbox>-<netbox-docker>-tv<netbox-topology-views>
ARG VERSION=v4.7.5-5.1.2-tv5.0.2

COPY plugin_requirements.txt /opt/netbox/
COPY plugins.py /etc/netbox/config/plugins.py
RUN /usr/local/bin/uv pip install --require-hashes -r /opt/netbox/plugin_requirements.txt \
 && DEBUG="true" SECRET_KEY="dummyKeyWithMinimumLength-------------------------" \
    /opt/netbox/venv/bin/python /opt/netbox/netbox/manage.py collectstatic --no-input

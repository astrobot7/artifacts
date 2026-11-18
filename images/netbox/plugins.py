# Replaces netbox-docker's empty /etc/netbox/config/plugins.py.
PLUGINS = ["netbox_topology_views", "netbox_dns"]

PLUGINS_CONFIG = {
    "netbox_topology_views": {
        # Keep node positions after dragging them on the map.
        "allow_coordinates_saving": True,
        "always_save_coordinates": True,
    },
}

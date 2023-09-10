```bash
# Sprawdzenie PID drona3 z użyciem narzędzia crictl.
crictl inspect $(crictl ps | grep dron3 | grep istio-proxy | cut -d" " -f1) | grep pid

# Podłaczenie się do przestrzeni kontenera.
nsenter -n --target pid

# Sprawdzenie wszystkich reguł iptables.
iptables-legacy -t nat -L -v
```
```bash
# OUTBOUND
istioctl proxy-config all dron3-75cd865d65-hkwcl -o json | jq ".configs[2].dynamic_listeners[16]" | gron | grep HttpConnectionManage
istioctl proxy-config all dron3-75cd865d65-hkwcl -o json | jq ".configs[2].dynamic_listeners[16]..active_state.listener.filter_chains[0].filters[0]"
# INBOUND
istioctl proxy-config all dron3-75cd865d65-hkwcl -o json | jq ".configs[2].dynamic_listeners[25]" | gron | grep HttpConnectionManage
.configs[2].dynamic_listeners[25].active_state.listener.filter_chains[1].filters[1].typed_config["@type"] = "type.googleapis.com/envoy.extensions.filters.network.http_connection_manager.v3.HttpConnectionManager";
.configs[2].dynamic_listeners[25].active_state.listener.filter_chains[2].filters[1].typed_config["@type"] = "type.googleapis.com/envoy.extensions.filters.network.http_connection_manager.v3.HttpConnectionManager";
.configs[2].dynamic_listeners[25].active_state.listener.filter_chains[6].filters[1].typed_config["@type"] = "type.googleapis.com/envoy.extensions.filters.network.http_connection_manager.v3.HttpConnectionManager";
.configs[2].dynamic_listeners[25].active_state.listener.filter_chains[7].filters[1].typed_config["@type"] = "type.googleapis.com/envoy.extensions.filters.network.http_connection_manager.v3.HttpConnectionManager";

```


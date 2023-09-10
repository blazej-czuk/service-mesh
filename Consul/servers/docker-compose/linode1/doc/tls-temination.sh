# pgadmin-envoy
# General show list of tls certs
xh http://pgadmin.service.consul:8001/config_dump | gron |grep tls_certificates

# dynamic_active_clusters[1]
xh http://pgadmin.service.consul:8001/config_dump | \
jq .configs[1].dynamic_active_clusters[1].cluster.transport_socket.typed_config.common_tls_context.tls_certificates[0].certificate_chain.inline_string | \
sed -e 's/\\n/\n/g' -e 's/^"//' -e 's/"$//' | \
openssl x509 -noout -text

# trusted CA
xh http://pgadmin.service.consul:8001/config_dump | gron |grep trusted_ca

xh http://pgadmin.service.consul:8001/config_dump | \
jq .configs[1].dynamic_active_clusters[1].cluster.transport_socket


xh http://pgadmin.service.consul:8001/config_dump | \
jq .configs[1].dynamic_active_clusters[1].cluster.transport_socket.typed_config.common_tls_context.validation_context.trusted_ca.inline_string | \
sed -e 's/\\n/\n/g' -e 's/^"//' -e 's/"$//' | \
openssl x509 -noout -text

# dynamic_listeners[0]
xh http://pgadmin.service.consul:8001/config_dump | \
jq .configs[2].dynamic_listeners[0].active_state.listener.filter_chains[0].transport_socket.typed_config.common_tls_context.tls_certificates[0].certificate_chain.inline_string | \
sed -e 's/\\n/\n/g' -e 's/^"//' -e 's/"$//' | \
openssl x509 -noout -text


# postgres-envoy
# General show list of tls certs
xh http://postgres.service.consul:8001/config_dump | gron |grep tls_certificates

# dynamic_listeners[0]
xh http://postgres.service.consul:8001/config_dump | \
jq .configs[2].dynamic_listeners[0].active_state.listener.filter_chains[0].transport_socket.typed_config.common_tls_context.tls_certificates[0].certificate_chain.inline_string | \
sed -e 's/\\n/\n/g' -e 's/^"//' -e 's/"$//' | \
 openssl x509 -noout -text

# trusted CA
xh http://postgres.service.consul:8001/config_dump | gron |grep trusted_ca

xh http://postgres.service.consul:8001/config_dump | \
jq .configs[2].dynamic_listeners[0]




xh http://postgres.service.consul:8001/config_dump | \
jq .configs[2].dynamic_listeners[0].active_state.listener.filter_chains[0].transport_socket.typed_config.common_tls_context.validation_context.trusted_ca.inline_string | \
sed -e 's/\\n/\n/g' -e 's/^"//' -e 's/"$//' | \
openssl x509 -noout -text


# consul-server
# Root CA request
xh -b http://10.5.0.2:8500/v1/connect/ca/roots | \
jq .Roots[0].RootCert | \
sed -e 's/\\n/\n/g' -e 's/^"//' -e 's/"$//' | \
openssl x509 -noout -text



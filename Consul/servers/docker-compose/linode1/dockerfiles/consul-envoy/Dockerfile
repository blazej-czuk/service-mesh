### CONFIGURATION ###
ARG ENVOY_IMAGE=envoyproxy/envoy:v1.24-latest
ARG CONSUL_IMAGE=hashicorp/consul:1.14
### END CONFIGURATION ###
FROM ${ENVOY_IMAGE} as envoy-bin
FROM ${CONSUL_IMAGE} as consul-bin
FROM ubuntu 
ENV CONSUL_HTTP_ADDR=http://localhost:8500
RUN apt-get update && \
    apt-get install -y \
      bash \
      curl \
      jq && \
    rm -rf /var/lib/apt/lists/*
COPY --from=envoy-bin /usr/local/bin/envoy /bin/envoy
COPY --from=consul-bin /bin/consul /bin/consul
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
# consul auto-config
https://developer.hashicorp.com/consul/tutorials/docker/docker-compose-auto-config

# distributed-tracing
https://developer.hashicorp.com/consul/docs/connect/distributed-tracing


# configuring dns

```bash
mkdir /etc/systemd/resolved.conf.d
cat << EOF > /etc/systemd/resolved.conf.d/consul.conf
[Resolve]
DNS=192.168.151.169:8600
DNSSEC=false
EOF
systemctl restart systemd-resolved
```
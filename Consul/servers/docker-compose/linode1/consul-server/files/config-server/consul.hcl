datacenter = "dc1"
log_level  = "DEBUG"
server=true
bootstrap_expect = 1

node_name = "consul-dc-linode1"
bind_addr = "0.0.0.0"
client_addr = "0.0.0.0"

ports {
    grpc = 8502
}

connect {
    enabled = true
}

advertise_addr = "10.5.0.2"
enable_central_service_config = true



// There are two different systems that need to be configured separately to encrypt communication within the datacenter: 
// gossip encryption and TLS. 
// TLS is used to secure the RPC calls between agents. 
// Gossip communication is secured with a symmetric key, since gossip between agents is done over UDP. 
// In this tutorial, you will only configure gossip encryption.

# encrypt = "dSbZzwmn123n7yo7qi1GsQ=="  (Base64 encoded  gossip encryption)  port (8300, 8301, 8302)

# Secure Consul Agent Communication with TLS Encryption (gRPC API calls port 8500. 8501, 8502)
# Consul supports using TLS to verify the authenticity of servers and clients. 
# To enable TLS, Consul requires that all servers have certificates that are signed by a single Certificate Authority(CA)
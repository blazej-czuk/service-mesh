service {
  name = "pgadmin"
  address = "10.5.0.11"
  id = "pgadmin-id"
  port = 80

  connect {
    sidecar_service {
      port = 20011
      proxy {
        upstreams {
          destination_name = "postgres"
          local_bind_port = 9091
        }
      }
    }
  } 
}
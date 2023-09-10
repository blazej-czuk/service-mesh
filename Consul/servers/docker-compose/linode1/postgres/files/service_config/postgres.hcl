service {
  name = "postgres"
  id = "postgres-id"
  address = "10.5.0.10"
  port = 5432

  connect {
    sidecar_service {
        port = 20005
        proxy {

        }
    }
  } 
}
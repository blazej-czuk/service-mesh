Kind = "service-intentions"
Name = "postgres"
Sources = [
  {
    Name   = "pgadmin"
    Action = "allow"
  },
  {
    Name   = "*"
    Action = "deny"
  }
]


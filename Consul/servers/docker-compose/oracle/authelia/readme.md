
# generownie hasła
    docker run -v /home/bczu/Desktop/Personal/github/ansible/servers/docker_compose/oracle/authelia/files/config/configuration.yml:/configuration.yml -it authelia/authelia:latest authelia crypto hash generate --config /configuration.yml
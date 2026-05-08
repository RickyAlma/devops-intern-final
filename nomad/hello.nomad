job "hello-devops" {
  datacenters = ["dc1"]

  type = "service"

  group "app" {
    count = 1

    task "server" {
      driver = "docker"

      config {
        image = "hello-devops"
      }

      resources {
        cpu    = 500
        memory = 256
      }
    }
  }
}
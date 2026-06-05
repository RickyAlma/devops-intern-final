job "hello-devops" {
  datacenters = ["dc1"]

  type = "service"

  group "app" {
    count = 1

    restart {
      attempts = 2
      interval = "5m"
      delay    = "15s"
      mode     = "fail"
    }

    task "server" {
      driver = "docker"

      config {
        image      = "localhost:5001/hello-devops:v2"
        force_pull = true
      }

      resources {
        cpu    = 100
        memory = 128
      }
    }
  }
}
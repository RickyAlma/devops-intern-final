# DevOps Intern Final Project

**Name**: Jerry Arickmun Dandi  
**Date**: May 7, 2026  

This project demonstrates a small but realistic DevOps workflow using:
- Linux
- GitHub
- Docker
- GitHub Actions (CI/CD)
- Nomad (scheduling containers)
- Monitoring (Loki + Promtail)

All code and configuration files required for the pipeline are included in this repo.

## Docker Basics ##

This project uses Docker to containerize the `hello.py` script.

### 1. How to build and run

1. Build the image:
   ```bash
   docker build -t hello-devops .
   ```

2. Run the container:
   ```bash
   docker run --rm hello-devops
   ```

Output: Hello, DevOps!



## 2. Job Deployment with Nomad

I used a Nomad service job to run the Docker container.

### How to run

1. Start the local registry used by Nomad:

```bash
docker compose up -d registry
```

2. Build and push the image to the local registry:

```bash
docker build -t localhost:5001/hello-devops:v2 .
docker push localhost:5001/hello-devops:v2
```

3. Start Nomad in dev mode (if it is not already running):

```bash
nomad agent -dev
```

4. Run the Nomad job:

```bash
nomad job run nomad/hello.nomad
```

5. Check status:

```bash
nomad status hello-devops
```


## 3. Monitoring with Grafana Loki and Promtail

I run Loki locally in Docker and use Promtail to forward Docker logs into Loki.

### How to reproduce

1. Start Loki and Promtail using Docker Compose:

```bash
docker compose up -d
```

2. Verify the Promtail service is running:

```bash
docker compose logs promtail
```

3. Query logs with `logcli`:

```bash
docker run --rm -it --network host grafana/logcli:latest \
  --addr=http://localhost:3100 \
  query '{job="docker"}' --limit=20
```

Details: see `monitoring/loki_setup.txt` and `monitoring/promtail-config.yml`.

## 4. Extra Credit – MLflow Tracking

I attempted to log a dummy MLflow experiment to demonstrate tracking capabilities, however, local environment restrictions prevented the global installation of the necessary Python packages



# DevOps Pipeline Project

**Name**: Jerry Arickmun Dandi  
**Date**: May 7, 2026  

This project demonstrates a small but realistic DevOps workflow using:
- Linux
- GitHub
- Docker
- GitHub Actions (CI/CD)
- Nomad (scheduling containers)
- Monitoring (Prometheus + Grafana)

All code, configs, screenshots, and documentation are included in this repo.

# DevOps Intern Final Project

**Name**: Jerry Arickmun Dandi  
**Date**: May 7, 2026  


...

## Docker Basics ##

This project uses Docker to containerize the `hello.py` script.

### How to build and run

1. Build the image:
   ```bash
   docker build -t hello-devops .
   ```

2. Run the container:
   ```bash
   docker run --rm hello-devops
   ```

Output: hello-devops





## 5. Job Deployment with Nomad

I used a Nomad service job to run the Docker container.

### How to run

1. Ensure the Docker image exists:

```bash
docker build -t hello-devops .
```

2. Start Nomad in dev mode:

```bash
nomad agent -dev
```

3. Run the Nomad job:

```bash
nomad job run nomad/hello.nomad
```

4. Check status:

```bash
nomad status hello-devops
```


##  6. Monitoring with Grafana Loki

I run Loki locally in Docker to collect logs from containers.

### How to reproduce

1. Start Loki:

```bash
docker run -d --name loki -p 3100:3100 grafana/loki:2.9.1
```

2. Install and use `logcli` to query logs:

```bash
docker run --rm -it --network host grafana/logcli:2.9.1 \
  --addr=http://localhost:3100 \
  query '{job="docker"}' --limit=20
```

Details: see `monitoring/loki_setup.txt`.
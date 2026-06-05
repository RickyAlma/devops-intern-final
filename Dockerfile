FROM python:3.11-slim

ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY app/hello.py .

CMD ["python", "hello.py"]

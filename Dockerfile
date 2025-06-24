# Stage 1: Build Stage
ARG PYTHON_VERSION=3.8
FROM python:${PYTHON_VERSION} as builder

WORKDIR /app
COPY . .

# Stage 2: Run Stage
FROM python:${PYTHON_VERSION} as run

# Install MySQL client for health checks
RUN apt-get update && \
    apt-get install -y default-mysql-client && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Set environment variables
ENV PYTHONPATH=/app \
    PYTHONUNBUFFERED=1

COPY --from=builder /app .

RUN pip install --upgrade pip && \
    pip install -r requirements.txt

# Copy and make entrypoint executable
COPY docker-entrypoint.sh /app/
RUN chmod +x /app/docker-entrypoint.sh

EXPOSE 8080

ENTRYPOINT ["./docker-entrypoint.sh"]

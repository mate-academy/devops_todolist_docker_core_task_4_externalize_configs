ARG PYTHON_VERSION=3.8
FROM python:${PYTHON_VERSION}

# Встановлюємо MySQL клієнт для перевірки здоров'я
RUN apt-get update && \
    apt-get install -y default-mysql-client && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Встановлюємо залежності окремо для кешування
COPY requirements.txt .
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

# Копіюємо решту додатку
COPY . .

# Робимо entrypoint виконуваним
RUN chmod +x docker-entrypoint.sh

ENV PYTHONPATH=/app \
    PYTHONUNBUFFERED=1

EXPOSE 8080

ENTRYPOINT ["./docker-entrypoint.sh"]

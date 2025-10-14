#!/bin/sh
set -e

# Чекання MySQL (тільки якщо ENGINE = mysql)
if [ "$ENGINE" = "mysql.connector.django" ]; then
  echo "Waiting for MySQL at $HOST:$PORT..."
  while ! nc -z "$HOST" "$PORT"; do
    echo "Still waiting..."
    sleep 3
  done
fi

# Міграції
python manage.py migrate

# Запуск Django
exec python manage.py runserver 0.0.0.0:8080

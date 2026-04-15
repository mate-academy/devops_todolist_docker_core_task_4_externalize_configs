#!/bin/sh
# wait_for_db.sh — polls MySQL until it accepts connections, then runs
# Django migrations and starts the development server.

set -e

DB_HOST="${HOST:-mysql}"
DB_PORT="${PORT:-3306}"
DB_USER="${USER:-app_user}"
DB_PASSWORD="${PASSWORD:-1234}"

echo "Waiting for MySQL at $DB_HOST:$DB_PORT ..."

until mysqladmin ping -h "$DB_HOST" -P "$DB_PORT" -u "$DB_USER" -p"$DB_PASSWORD" --silent 2>/dev/null; do
  echo "  MySQL is not ready yet — retrying in 3 s..."
  sleep 3
done

echo "MySQL is ready. Running migrations..."
python manage.py migrate --noinput

echo "Starting Django development server..."
exec python manage.py runserver 0.0.0.0:8080

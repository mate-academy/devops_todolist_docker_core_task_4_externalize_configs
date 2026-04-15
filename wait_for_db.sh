#!/bin/sh
# wait_for_db.sh — polls MySQL until it accepts connections using the
# mysql-connector-python driver that is already installed in the image,
# then runs Django migrations and starts the development server.

set -e

DB_HOST="${HOST:-mysql}"
DB_PORT="${PORT:-3306}"
DB_USER="${USER:-app_user}"
DB_PASSWORD="${PASSWORD:-1234}"
DB_NAME="${NAME:-app_db}"

echo "Waiting for MySQL at $DB_HOST:$DB_PORT ..."

until python - <<EOF
import sys
try:
    import mysql.connector
    conn = mysql.connector.connect(
        host="$DB_HOST",
        port=$DB_PORT,
        user="$DB_USER",
        password="$DB_PASSWORD",
        database="$DB_NAME",
        connection_timeout=3,
    )
    conn.close()
    sys.exit(0)
except Exception as e:
    print(f"  DB not ready: {e}")
    sys.exit(1)
EOF
do
  echo "  MySQL is not ready yet — retrying in 3 s..."
  sleep 3
done

echo "MySQL is ready. Running migrations..."
python manage.py migrate --noinput

echo "Starting Django development server..."
exec python manage.py runserver 0.0.0.0:8080

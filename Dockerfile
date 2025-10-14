ARG PYTHON_VERSION=3.8
FROM python:${PYTHON_VERSION}

WORKDIR /app

# Копіюємо спершу тільки requirements.txt для кешування залежностей
COPY requirements.txt .

ENV PYTHONUNBUFFERED=1

# Встановлюємо залежності без кешу
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Копіюємо решту коду після встановлення залежностей
COPY . .

EXPOSE 8080

# Inline entrypoint з чеканням БД та fallback на SQLite
ENTRYPOINT ["sh", "-c", "\
  if [ -z \"$ENGINE\" ]; then \
    echo 'ENGINE not set, using SQLite fallback'; \
    export ENGINE='django.db.backends.sqlite3'; \
    export NAME='db.sqlite3'; \
    export USER=''; \
    export PASSWORD=''; \
    export HOST=''; \
    export PORT=''; \
  fi; \
  until python manage.py migrate; do \
    echo 'Waiting for DB...'; \
    sleep 3; \
  done; \
  python manage.py runserver 0.0.0.0:8080 \
"]

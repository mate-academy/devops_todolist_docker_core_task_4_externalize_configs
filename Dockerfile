FROM python:3.8

ENV PYTHONUNBUFFERED 1
WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

RUN apt-get update && apt-get install -y netcat-openbsd

COPY . .

EXPOSE 8000
ENTRYPOINT ["sh", "-c", "while ! nc -z db 3306; do echo 'Waiting for MySQL...'; sleep 1; done; python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]
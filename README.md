Docker Compose Setup for Django Todo App with MySQL and ENV Configuration

📌 Project Overview
This project configures a Django-based Todo application to run in Docker containers alongside a MySQL database.
It uses Docker Compose with semantic versioning, environment variables for dynamic database configuration, and persistent storage for MySQL.

🛠 Tech Stack
    - Docker & Docker Compose

    - MySQL

    - Python / Django

    - Semantic Versioning

    - Shell / Environment Variables

🚀 What Was Done
1. Updated docker-compose.yml to:

    - Use semantic versioning for images:

        - todo-app:2.1.0

        - mysql-db:1.1.0
          
    - Pass database connection settings via environment variables:
        - ENGINE=django.db.backends.mysql
        - NAME=app_db
        - USER=app_user
        - PASSWORD=1234
        - HOST=mysql
        - PORT=3306
2. Modified todolist/settings.py to dynamically read environment variables for the DATABASES configuration.

3. Ensured MySQL container uses a named volume for persistent data storage.












# Dockerization
  This project involves containerizing a Python-based To-Do List application using Docker. The application will connect to a MySQL database, with data persistence managed via Docker volumes. Configuration settings will be externalized using environment variables or configuration files, ensuring flexibility and security. 

## Explore
Try it out by installing the requirements. (Works only with python >= 3.8, due to Django 4)

    pip install -r requirements.txt

Create a database schema:

    python manage.py migrate

And then start the server (default: http://localhost:8000)

    python manage.py runserver


Now you can browse the [API](http://localhost:8000/api/)
or start on the [landing page](http://localhost:8000/)

#### Requirements
1. Update docker-compose to be able to set such env variables:
    - ENGINE
    - NAME
    - USER
    - PASSWORD
    - HOST
    - PORT
2. Update your app to read ENV vars and set DATABASES section fields inside of todolist/settigns.py file
3. Use semantic versioning to tag image inside the docker-compose
4. TODO App should work as before
5. Create PR with your changes and attach it for validation on a platform











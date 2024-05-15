### To launch app using base container orchestration(docker-compose) with ENV file:

1. Create .env file. Copy placeholders from .env.example. Replace the placeholder values with your actual environment variable values.

2. To start(add flag -d for detach mode)

```
docker-compose up

```

3. You can access app by typing "http://localhost:8080" in browser's address bar.

4. To finish

```
docker-compose down
```

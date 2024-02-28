For using orchestrated via docker-compose.yml file amazing todo application with database and external config please follow instruction below:
1. Create .env from template
```
cp .env.example .env
```
2. Run containers composition by executing
```
docker-compose up -d
```
3. You can enjoy fantastic todo application on http://0.0.0.0:8080/ and browse the [API](http://localhost:8000/api/)
4. To stop and remove all container enter
```
docker-compose down 
```

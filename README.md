# API PHP - Immo

Ce projet est une API construite avec PHP pour l'application Immo.

## Instructions

### Installation des dépendances

Pour installer les dépendances du projet, exécutez :

```sh
composer install
```

### Développement

Pour démarrer le serveur de développement, exécutez :

```sh
php -S localhost:8080 -t public
```

### Docker

Pour construire et exécuter l'application avec Docker, utilisez les commandes suivantes :

```sh
docker build -t immo-api-php .
docker run -p 8080:80 immo-api-php
```

## Docker Compose

Pour utiliser Docker Compose et exécuter tous les services définis dans le fichier `docker-compose.yml`, utilisez les commandes suivantes :

### Créer un fichier `docker-compose.yml`

```yaml
version: '3.8'

services:
  immo-admin-react:
    build:
      context: ./immo-admin-react
      dockerfile: Dockerfile
    ports:
      - "3000:80"

  immo-api-php:
    build:
      context: ./immo-api-php
      dockerfile: Dockerfile
    ports:
      - "8080:80"
    environment:
      - DB_HOST=db
      - DB_DATABASE=immo
      - DB_USERNAME=root
      - DB_PASSWORD=root
    depends_on:
      - db

  immo-client-vue:
    build:
      context: ./immo-client-vue
      dockerfile: Dockerfile
    ports:
      - "8081:80"

  db:
    image: mysql:5.7
    environment:
      MYSQL_ROOT_PASSWORD: root
      MYSQL_DATABASE: immo
    ports:
      - "3306:3306"
    volumes:
      - db_data:/var/lib/mysql

volumes:
  db_data:
```

### Démarrer les services

Pour démarrer tous les services définis dans le fichier `docker-compose.yml`, exécutez :

```sh
docker-compose up --build
```

Cela construira et démarrera tous les conteneurs définis dans le fichier `docker-compose.yml`.

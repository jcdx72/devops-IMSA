## EX 1 : Gestion des images et Dockerfiles
**Objectif :** Apprendre à créer des images personnalisées avec un Dockerfile.

### Créer un Dockerfile basique
Créer un fichier nommé **Dockerfile** avec le contenu suivant :
```dockerfile
FROM alpine:latest
RUN apk add --no-cache python3
CMD ["python3", "--version"]
```

### Construire une image Docker
```bash
docker build -t mon-python-alpine .
```

### Lancer un conteneur basé sur l’image
```bash
docker run --name python-container mon-python-alpine
```

### Inspecter l’image
```bash
docker inspect mon-python-alpine
```

---

## EX 2 : Docker Compose
**Objectif :** Automatiser le déploiement de plusieurs conteneurs avec Docker Compose.

### Fichier `docker-compose.yml`
```yaml
version: '3'

services:
  db:
    image: mysql
    environment:
      MYSQL_ROOT_PASSWORD: root
    volumes:
      - db_data:/var/lib/mysql
    networks:
      - mon-reseau

  phpmyadmin:
    image: phpmyadmin/phpmyadmin
    ports:
      - "8080:80"
    networks:
      - mon-reseau

volumes:
  db_data:

networks:
  mon-reseau:
```

### Lancer Docker Compose
```bash
docker-compose up -d
```

### Arrêter et nettoyer
```bash
docker-compose down
```


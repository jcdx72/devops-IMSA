# TP Docker

## EX 1 : Manipulation des conteneurs de base
**Objectif :** Apprendre à gérer les conteneurs Docker avec différentes commandes.

### Lancer un conteneur interactif
Utilise l’option interactive pour lancer un conteneur Ubuntu et accéder directement à son terminal :

```bash
docker run -it --name mon-ubuntu ubuntu bash
```

Cette commande démarre un conteneur avec une session interactive.  
Tu peux maintenant explorer l’intérieur du conteneur avec des commandes comme `ls`, `cd`, etc.

### Vérifier les conteneurs en cours d'exécution
```bash
docker ps
```

Liste les conteneurs actifs.

### Consulter les logs d’un conteneur
Lancer un conteneur Nginx pour générer des logs :
```bash
docker run -d --name nginx-container -p 8080:80 nginx
docker logs nginx-container
```

### Inspecter un conteneur
```bash
docker inspect nginx-container
```

### Stopper, redémarrer et tuer un conteneur
```bash
docker stop nginx-container
docker start nginx-container
docker kill nginx-container
```

### Supprimer un conteneur
```bash
docker rm nginx-container
```

## EX 2 : Gestion des volumes
**Objectif :** Apprendre à créer et utiliser des volumes pour persister les données.

### Créer un volume Docker
```bash
docker volume create mon-volume
```

### Inspecter un volume
```bash
docker volume inspect mon-volume
```

### Lier un volume à un conteneur
```bash
docker run -d -p 8080:80 --name nginx-volume --mount source=mon-volume,target=/usr/share/nginx/html nginx
```

### Tester la persistance
```bash
docker exec -it nginx-volume bash
echo "<h1>Hello, Docker Volume</h1>" > /usr/share/nginx/html/index.html
```
👉 Accéder à [http://localhost:8080](http://localhost:8080)

---

## EX 3 : Gestion des réseaux Docker
**Objectif :** Apprendre à configurer et utiliser des réseaux entre des conteneurs.

### Créer un réseau
```bash
docker network create mon-reseau
```

### Lancer des conteneurs sur le réseau
```bash
docker run -d --name db --network mon-reseau -e MYSQL_ROOT_PASSWORD=root mysql
docker run -d --name pma --network mon-reseau -p 8081:80 phpmyadmin/phpmyadmin
```

👉 Accéder à [http://localhost:8081](http://localhost:8081)  
Login : `root`  
Mot de passe : `root`

### Inspecter le réseau
```bash
docker network inspect mon-reseau
```

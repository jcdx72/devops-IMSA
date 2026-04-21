# Lab Jenkins avec Docker et Maven pour builder un projet depuis GitHub

## A - Intégration Continue (CI)

### Prérequis

1. Jenkins déjà configuré : http://57.128.215.130:8080/
2. Créer un compte GitHub : https://github.com
3. Forker le projet Maven avec Jenkinsfile :  
   https://github.com/BAliani/simple-java-maven-app.git
4. Docker installé sur la machine Jenkins (déjà fait)

---

## Étapes du Lab

### 1. Créer un pipeline Jenkins

#### 1.1 Créer un job

- Aller dans Jenkins → **New Item**
- Choisir **Pipeline**
- Nom : `Maven-Docker-GitHub-Build`

#### 1.2 Configurer le pipeline

- Section **Pipeline** :
  - Choisir **Pipeline script from SCM**
  - SCM : **Git**
  - Repository URL :
    ```
    https://github.com/<votre-namespace>/simple-java-maven-app.git
    ```
  - Branche : `main` ou `master`
  - Script Path : `jenkinsfile`

---

### 2. Jenkinsfile avec Docker

Exemple disponible ici :  
https://github.com/BAliani/simple-java-maven-app/blob/master/jenkinsfile

#### Explication

- `agent` → exécution dans un conteneur `maven:3.9.2`
- Volume : -v /root/.m2:/root/.m2

→ partage du cache Maven
- Étapes :
- Build
- Test

---

### 3. Exécution du job

1. Cliquer sur **Build Now**
2. Jenkins :
 - Clone le repo GitHub
 - Build le projet
 - Lance les tests dans Docker

---

### 4. Résultats

- Logs visibles dans **Console Output**
- Fichier `.jar` archivé en cas de succès

---

### 5. Déclenchement automatique (Webhook GitHub)

#### Installer plugin

- **Manage Jenkins → Manage Plugins**
- Installer : `GitHub Integration Plugin` (déjà fait)

#### Configurer Jenkins

- Aller dans le job → **Configure**
- Section **Build Triggers**
- Cocher : GitHub hook trigger for GITScm polling

#### Créer un Webhook GitHub

- Repo GitHub → **Settings → Webhooks**
- **Add webhook**

Configuration :

- Payload URL : http://151.80.61.88:8080/github-webhook/

- Content type : `application/json`
- Event : `Just the push event`

#### Test

- Faire un `commit` + `push`
- Jenkins déclenche automatiquement le build

---

## B - Livraison Continue (CD) : Docker

### Prérequis

1. Compte Docker Hub : https://hub.docker.com/
2. Créer un repo (ex: `my-maven-app`)
3. Générer un token Docker Hub
4. Token GitHub si repo privé

---

### Générer un token Docker Hub

1. Login Docker Hub
2. **Account Settings**
3. **Security**
4. **New Access Token**
5. Nom : `Jenkins-Token`
6. Permission : `Read/Write`
7. Copier le token

---

### Étape 1 : Nouveau job Jenkins

- **New Item**
- Type : **Freestyle Project**
- Nom : `Build-and-Push-Docker-Image`

---

### Étape 2 : Déclenchement automatique

- Section **Build Triggers**
- Cocher : Build after other projects are built
- Projet : Maven-Docker-GitHub-Build

---

### Étape 3 : Variables Docker Hub

- Section **Build Environment**
- Cocher : Inject environment variables to the build process
- Ajouter : 

```
DOCKER_LOGIN=your-docker-username
DOCKER_PASS=your-docker-token
```

---

### Étape 4 : Script Shell

Ajouter un **Execute shell** :

```bash
# Build image Docker
docker build -t <docker-id>/my-maven-app:$BUILD_NUMBER .

# Login Docker Hub
docker login -u $DOCKER_LOGIN -p $DOCKER_PASS

# Push image
docker push <docker-id>/my-maven-app:$BUILD_NUMBER
```

Remplacer <docker-id> par votre identifiant Docker Hub.

### Étape 5 : Test

Lancer le premier job
Le second job se déclenche automatiquement
Vérifier les logs

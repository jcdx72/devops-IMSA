# 🧩 TP1 — Mes premièrs Jobs

## 🧱 1. Freestyle Project

### 🎯 Objectif
Créer un **projet simple** sans script, basé sur des actions configurées dans l’interface.

### ⚙️ Étapes
0. utiliser l'instance Jenkins: 
1. Tableau de bord → **Nouveau Item**  
2. Nom : `TP1-Freestyle`  
3. Type : **Projet freestyle**  
4. Configurer :  
   - **Description :** « Projet Freestyle de test »  
   - **Build Triggers :** “Build périodique” → `H/5 * * * *` (toutes les 5 min)  
   - **Build Steps :**
     - “Exécuter une commande shell” :  
       ```bash
       echo "Bonjour Jenkins !"
       echo "Date du build : $(date)"
       ```

5. Sauvegarder → **Build Now**  

### 🔍 Résultat
Ce job s’exécute périodiquement, sans pipeline scripté.  
> Idéal pour les tests simples, les jobs d’intégration, ou les scripts de maintenance.


## 🔁 2. Pipeline Project

### 🎯 Objectif
Créer un pipeline scripté via un **Jenkinsfile**.

### ⚙️ Étapes

1. Nouveau Item → `TP1-Pipeline`  
2. Type : **Pipeline**  
3. Section *Pipeline script* :

```groovy
pipeline {
    agent any
    stages {
        stage('Hello') {
            steps {
                echo "Hello depuis un pipeline !"
            }
        }
    }
}
```

4. Sauvegarde → **Build Now**

### 🔍 Résultat
Un pipeline codé et versionné.  
> Idéal pour l’automatisation CI/CD, avec gestion des branches et artefacts.

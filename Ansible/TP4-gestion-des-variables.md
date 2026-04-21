# Gestion des variables

## Objectif :
Améliorer le playbook précédent en utilisant des variables pour gérer les noms des répertoires, les utilisateurs et les groupes. L'exercice se déroule en 4 étapes :

1. Créer une variable pour stocker le nom du répertoire.
2. Utiliser les loops pour créer plusieurs répertoires via la même tâche.
3. Utiliser les `host_vars` pour définir des variables spécifiques à un hôte.
4. Utiliser les `group_vars` pour définir des variables communes à un groupe d'hôtes.

---

## Contexte
Vous devez améliorer le playbook précédent pour le rendre plus flexible et réutilisable. L'objectif est de :

- Utiliser des variables pour éviter de coder en dur les noms des répertoires, utilisateurs et groupes.
- Créer plusieurs répertoires en une seule tâche grâce aux loops.
- Définir des variables spécifiques à un hôte ou à un groupe d'hôtes.

---

## Étapes à suivre

### 1. Créer une variable pour stocker le nom du répertoire
- Définissez une variable nommée `app_directory` pour stocker le chemin du répertoire à créer (par exemple, `/app_data`).
- Utilisez cette variable dans la tâche de création du répertoire.

### 2. Utiliser les loops pour créer plusieurs répertoires
- Définissez une liste de répertoires à créer, par exemple :
  ```yaml
  app_directories:
    - /app_data
    - /app_logs
    - /app_config
  ```
- Utilisez une boucle (loop) pour créer tous les répertoires en une seule tâche.

### 3. Utiliser les host_vars

- Créez un fichier host_vars pour un hôte spécifique (par exemple, host1.yml).
- Dans ce fichier, définissez des variables spécifiques à cet hôte, comme un nom d'utilisateur ou un groupe personnalisé.
- Utilisez ces variables dans le playbook

### 4. Utiliser les group_vars

- Créez un fichier group_vars pour un groupe d'hôtes (par exemple, webservers.yml).
- Dans ce fichier, définissez des variables communes à tous les hôtes du groupe, comme un répertoire par défaut ou des permissions.
- Utilisez ces variables dans le playbook.

---

### Structure du playbook

Le playbook doit être structuré comme suit :

- Définir les variables dans des fichiers séparés (host_vars et group_vars).
- Utiliser ces variables dans le playbook.
- Utiliser une boucle pour créer plusieurs répertoires.

## Fichiers à fournir
1. Un playbook Ansible nommé `setup_app_environment_with_vars.yml`.
2. Un fichier `host_vars/host1.yml` pour définir des variables spécifiques à un hôte.
3. Un fichier `group_vars/webservers.yml` pour définir des variables communes à un groupe d'hôtes.

---

## Liens utiles de la documentation
- [Ansible Variables](https://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html)  
- [Ansible Loops](https://docs.ansible.com/ansible/latest/user_guide/playbooks_loops.html)  
- [Ansible host_vars and group_vars](https://docs.ansible.com/ansible/latest/user_guide/intro_inventory.html#organizing-host-and-group-variables)  



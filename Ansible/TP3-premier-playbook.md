# Objectif :
Créer un playbook Ansible qui automatise les tâches suivantes sur un ou plusieurs serveurs distants :

- Créer un répertoire.
- Créer un groupe d'utilisateurs.
- Créer un utilisateur et l'ajouter au groupe.
- Appliquer les droits de l'utilisateur créé et des permissions `744` sur le répertoire.

---

## Documentation officielle
Pour réaliser cet exercice, vous pouvez vous appuyer sur la [documentation officielle d'Ansible](https://docs.ansible.com/ansible/latest/index.html). N'hésitez pas à consulter les modules suivants :
- [`file`](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/file_module.html) pour la gestion des fichiers et répertoires.
- [`group`](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/group_module.html) pour la création de groupes.
- [`user`](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/user_module.html) pour la création d'utilisateurs.

---

## Contexte
Vous êtes administrateur système et devez préparer un environnement pour une nouvelle application. Cette application nécessite :

- Un répertoire dédié pour stocker des fichiers.
- Un groupe d'utilisateurs pour gérer les accès.
- Un utilisateur spécifique qui sera propriétaire du répertoire.
- Des permissions spécifiques sur le répertoire pour garantir la sécurité et l'accès.

---

## Étapes à suivre

### 1. Création d'un répertoire :
- Créez un répertoire nommé `/app_data` sur les serveurs distants.

### 2. Création d'un groupe d'utilisateurs :
- Créez un groupe nommé `app_group`.

### 3. Création d'un utilisateur :
- Créez un utilisateur nommé `app_user`.
- Assurez-vous que l'utilisateur a un répertoire home dans `/home/app_user`.
- Ajoutez l'utilisateur `app_user` au groupe `app_group`.

### 4. Application des droits sur le répertoire :
- Définissez `app_user` comme propriétaire du répertoire `/app_data`.
- Définissez `app_group` comme groupe propriétaire du répertoire `/app_data`.
- Appliquez les permissions `744` sur le répertoire `/app_data`.

---

## Structure du playbook
- Le playbook doit être écrit en YAML.
- Il doit contenir au moins quatre tâches :
  1. Création du répertoire.
  2. Création du groupe.
  3. Création de l'utilisateur et ajout au groupe.
  4. Application des droits et permissions sur le répertoire.

---

## Fichiers à fournir
- Un playbook Ansible nommé `setup_app_environment.yml`.

---

## Validation
Après avoir exécuté le playbook, vérifiez que :

1. Le répertoire `/app_data` existe.
2. Le groupe `app_group` existe.
3. L'utilisateur `app_user` existe et appartient au groupe `app_group`.
4. Le répertoire `/app_data` a :
   - `app_user` comme propriétaire.
   - `app_group` comme groupe propriétaire.
   - Les permissions `744` (`rwxr--r--`).

---

## Exemple de commande pour exécuter le playbook
```bash
ansible-playbook -i inventory setup_app_environment.yml
```
---

## Remarque
- Pensez à référencer votre solution (playbook) dans votre repos GIT.

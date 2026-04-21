#!/bin/bash

# Variables
SSH_KEY_PATH="$HOME/.ssh/id_rsa"  # Chemin de la clé SSH

# Détails des serveurs distants
SERVERS=(
  "ansible_user@ipNode1:password"  # Format: utilisateur@hôte:motdepasse
  "ansible_user@ipNode2:password"
)

# Vérifier si la clé existe déjà pour éviter la régénération
if [ ! -f "$SSH_KEY_PATH" ]; then
    echo "Génération d'une nouvelle clé RSA de 2048 bits..."
    ssh-keygen -t rsa -b 2048 -f "$SSH_KEY_PATH" -N ""
else
    echo "Clé SSH déjà existante. Aucune nouvelle clé générée."
fi

# Boucle sur chaque serveur pour copier la clé publique
for server in "${SERVERS[@]}"; do
    # Extraction des informations utilisateur, hôte et mot de passe
    REMOTE_USER_HOST=$(echo "$server" | cut -d':' -f1)
    REMOTE_PASS=$(echo "$server" | cut -d':' -f2)
    
    echo "Copie de la clé publique vers $REMOTE_USER_HOST..."

    # Copier la clé publique sans prompt de confirmation
    sshpass -p "$REMOTE_PASS" ssh-copy-id -i "$SSH_KEY_PATH.pub" -o StrictHostKeyChecking=no "$REMOTE_USER_HOST"
done

echo "Configuration SSH terminée pour tous les serveurs."

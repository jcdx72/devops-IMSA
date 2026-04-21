#!/bin/bash

# Nom du conteneur
CONTAINER_NAME="ansible_server"

# Fichiers à copier
FILES_TO_COPY=("inventory" "myscript.sh")  # Les fichiers à copier

# Vérifier si le conteneur est en cours d'exécution
if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
    echo "Le conteneur $CONTAINER_NAME est en cours d'exécution. Copie des fichiers..."

    # Boucle pour copier chaque fichier
    for FILE in "${FILES_TO_COPY[@]}"; do
        if [ -f "$FILE" ]; then  # Vérifier si le fichier existe
            docker cp "$FILE" "$CONTAINER_NAME:/"
            if [ $? -eq 0 ]; then
                echo "Le fichier $FILE a été copié avec succès dans le conteneur."
            else
                echo "Échec de la copie du fichier $FILE."
            fi
        else
            echo "Le fichier $FILE n'existe pas."
        fi
    done
else
    echo "Le conteneur $CONTAINER_NAME n'est pas en cours d'exécution."
fi

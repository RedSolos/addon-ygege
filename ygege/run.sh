#!/bin/sh
CONFIG_PATH=/data/options.json
TARGET="$(bashio::config 'target')"

# On vérifie que le fichier existe
if [ ! -f "$CONFIG_PATH" ]; then
    echo "Le fichier $CONFIG_PATH n'existe pas"
    exit 1
fi


# 1. On lit les valeurs du fichier JSON avec bashio
USER="$(bashio::config 'username')"
PASS="$(bashio::config 'password')"

echo "Démarrage du container avec l'utilisateur: $USER"

# 2. On exporte les variables exactement comme le container les attend
export YGG_USERNAME="$USER"
export YGG_PASSWORD="$PASS"

# 3. On lance la commande originale de l'image
# IMPORTANT : Remplace '/start-app.sh' par la commande 
# que ton image lance habituellement (regarde le ENTRYPOINT ou CMD du Dockerfile original)
exec /init
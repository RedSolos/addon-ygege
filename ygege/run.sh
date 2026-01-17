#!/bin/sh

# 1. On lit le fichier options.json généré par Home Assistant
# On utilise 'jq' pour extraire les valeurs proprement
USER=$(jq --raw-output '.ygg_username' /data/options.json)
PASS=$(jq --raw-output '.ygg_password' /data/options.json)

echo "Démarrage du container avec l'utilisateur: $USER"

# 2. On exporte les variables exactement comme le container les attend
export YGG_USERNAME="$USER"
export YGG_PASSWORD="$PASS"

# 3. On lance la commande originale de l'image
# IMPORTANT : Remplace '/start-app.sh' par la commande 
# que ton image lance habituellement (regarde le ENTRYPOINT ou CMD du Dockerfile original)
exec /init
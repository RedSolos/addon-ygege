# Remplace ceci par l'image que tu veux utiliser
FROM uwucode/ygege

# On doit installer 'jq' pour lire la config de Home Assistant.
# Si l'image est basée sur Alpine (la plupart des images légères) :
RUN apk add --no-cache jq

# Si l'image est basée sur Debian/Ubuntu (plus lourde), commente la ligne du dessus et utilise :
# RUN apt-get update && apt-get install -y jq && rm -rf /var/lib/apt/lists/*

# Copie du script de lancement
COPY run.sh /run.sh
RUN chmod a+x /run.sh

# On dit au container de lancer NOTRE script au démarrage
CMD [ "/run.sh" ]

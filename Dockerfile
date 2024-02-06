FROM openjdk:17

#/etc/minecraft -> donnée du serveur
#/etc/template -> données copiées dans /etc/minecraft au lancement

ADD template /etc/template

WORKDIR /etc/template

ENTRYPOINT ["/bin/bash", "run.sh"]

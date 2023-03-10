FROM openjdk:17

#/etc/minecraft -> donnée du serveur
#/etc/template -> données copiées dans /etc/minecraft au lancement

ADD template /etc/template

# MODS
# CC:Tweaked

# https://www.curseforge.com/minecraft/mc-mods/cc-tweaked
# https://www.curseforge.com/minecraft/mc-mods/plethora-peripherals
# https://www.curseforge.com/minecraft/mc-mods/advanced-peripherals !

# DOWNLOAD FABRIC
RUN curl -LJ https://meta.fabricmc.net/v2/versions/loader/1.19.3/0.14.17/0.11.2/server/jar -o /etc/template/fabric-server-launch.jar

# DOWNLOAD MODS
RUN cd /etc/template/mods \
  && curl -LJO https://mediafilez.forgecdn.net/files/4409/848/fabric-api-0.75.1%2B1.19.3.jar \
  && curl -LJO https://mediafilez.forgecdn.net/files/4153/752/cc-restitched-1.102.0.jar \
  && curl -LJO https://mediafilez.forgecdn.net/files/4415/833/Plethora-Fabric-1.4.6.jar \
  && curl -LJO https://mediafilez.forgecdn.net/files/4343/754/trinkets-3.5.1.jar \
  && curl -LJO https://mediafilez.forgecdn.net/files/4404/823/AdvancedPeripherals-0.7.25b.jar \
  && curl -LJO https://mediafilez.forgecdn.net/files/4030/849/fabric-language-kotlin-1.8.5%2Bkotlin.1.7.20.jar

WORKDIR /etc/template

ENTRYPOINT ["/bin/bash", "run.sh"]

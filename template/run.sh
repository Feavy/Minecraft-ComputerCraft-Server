#!/bin/bash

rm /etc/minecraft/mods/*.jar

cp -R /etc/template/* /etc/minecraft

cd /etc/minecraft

java -jar fabric-server-launch.jar

# Java 17 ist für aktuelle Minecraft-Versionen geeignet
FROM eclipse-temurin:17-jdk-jammy

# Arbeitsverzeichnis im Container
WORKDIR /mc

# Server-Binary und Startscript in das Image kopieren
COPY server.jar .
COPY start.sh .

# Script ausführbar machen
RUN chmod +x start.sh

# Default-ENV-Werte (können durch docker-compose überschrieben werden)
ENV MC_MEMORY=1024M \
    EULA=FALSE

# Minecraft-Server-Port im Container
EXPOSE 25565

# Startkommando
CMD ["./start.sh"]

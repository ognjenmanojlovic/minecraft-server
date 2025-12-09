FROM eclipse-temurin:21-jdk-jammy

WORKDIR /mc

COPY server.jar .
COPY start.sh .

RUN chmod +x start.sh

ENV MC_MEMORY=1024M \
    EULA=FALSE

EXPOSE 25565

CMD ["./start.sh"]

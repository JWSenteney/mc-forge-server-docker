FROM openjdk:8-jre-alpine

EXPOSE 25565 25575

RUN mkdir /minecraft && \
    cd /minecraft && \
    wget https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.7.10-10.13.4.1614-1.7.10/forge-1.7.10-10.13.4.1614-1.7.10-installer.jar && \
    java -jar forge-1.7.10-10.13.4.1614-1.7.10-installer.jar --installServer && \
    rm forge-1.7.10-10.13.4.1614-1.7.10-installer.jar forge-1.7.10-10.13.4.1614-1.7.10-installer.jar.log

WORKDIR /minecraft

COPY image/eula.txt eula.txt 

CMD [ "java", "-jar", "forge-1.7.10-10.13.4.1614-1.7.10-universal.jar" ]
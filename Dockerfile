FROM openjdk:8-jre-alpine

EXPOSE 25565

RUN mkdir /minecraft && \
    cd /minecraft && \
    wget https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.7.10-10.13.4.1614-1.7.10/forge-1.7.10-10.13.4.1614-1.7.10-installer.jar && \
    java -jar forge-1.7.10-10.13.4.1614-1.7.10-installer.jar --installServer && \
    wget https://github.com/itzg/rcon-cli/releases/download/1.4.0/rcon-cli_1.4.0_linux_amd64.tar.gz && \
    tar -x -C /usr/local/bin -f rcon-cli_1.4.0_linux_amd64.tar.gz rcon-cli && \
    rm forge-1.7.10-10.13.4.1614-1.7.10-installer.jar forge-1.7.10-10.13.4.1614-1.7.10-installer.jar.log rcon-cli_1.4.0_linux_amd64.tar.gz

WORKDIR /minecraft

COPY image/eula.txt eula.txt 

CMD [ "java", "-jar", "forge-1.7.10-10.13.4.1614-1.7.10-universal.jar" ]
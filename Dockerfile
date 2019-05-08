FROM openjdk:8-jre-alpine

EXPOSE 25565

RUN mkdir /minecraft

WORKDIR /minecraft

ENV MINECRAFT_VERSION 1.12.2

# initialize config files
COPY image tmp
RUN tmp/setup-files${MINECRAFT_VERSION}.sh && rm -r tmp

# install minecraft forge
ENV FORGE_VERSION 1.12.2-14.23.5.2836
RUN wget https://files.minecraftforge.net/maven/net/minecraftforge/forge/${FORGE_VERSION}/forge-${FORGE_VERSION}-installer.jar && \
    java -jar forge-${FORGE_VERSION}-installer.jar --installServer && \
    rm forge-${FORGE_VERSION}-installer.jar forge-${FORGE_VERSION}-installer.jar.log

# install rcon-cli
RUN wget https://github.com/itzg/rcon-cli/releases/download/1.4.0/rcon-cli_1.4.0_linux_amd64.tar.gz && \
    tar -x -C /usr/local/bin -f rcon-cli_1.4.0_linux_amd64.tar.gz rcon-cli && \
    rm rcon-cli_1.4.0_linux_amd64.tar.gz

ENV JAVA_ARGS -XX:HeapDumpPath=/minecraft/crash-reports/crash-heap.dump -XX:+HeapDumpOnOutOfMemoryError -XX:+UseG1GC -XX:+UnlockExperimentalVMOptions -XX:G1NewSizePercent=20 -XX:G1MaxNewSizePercent=60 -XX:G1ReservePercent=20 -XX:MaxGCPauseMillis=50 -XX:G1HeapRegionSize=32M
ENV JAVA_MEMORY_ARGS -Xms4G -Xmx4G

CMD java ${JAVA_ARGS} ${JAVA_MEMORY_ARGS} -jar forge-${FORGE_VERSION}-universal.jar
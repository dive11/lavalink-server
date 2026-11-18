FROM eclipse-temurin:17-jre
WORKDIR /opt/Lavalink
RUN apt-get update && apt-get install -y curl
RUN curl -s https://api.github.com/repos/lavalink-devs/Lavalink/releases/latest \
    | grep "browser_download_url.*.jar" \
    | cut -d '"' -f 4 \
    | wget -qi -
COPY application.yml /opt/Lavalink/application.yml
EXPOSE 2333
CMD ["java", "-jar", "Lavalink.jar"]

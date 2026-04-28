# Utilisation de l'image Eclipse Temurin pour Java 17 (remplace l'ancienne image openjdk)
FROM eclipse-temurin:17-jre-alpine

COPY mavenprog/target/*.jar app.jar

# Commande exécutée au démarrage du conteneur
ENTRYPOINT ["java", "-jar", "/app.jar"]

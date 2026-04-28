# Utilisation de l'image Eclipse Temurin pour Java 17 (remplace l'ancienne image openjdk)
FROM eclipse-temurin:17-jre-alpine

# On copie le fichier .jar généré par Maven depuis le dossier target vers le conteneur
COPY target/*.jar app.jar

# Commande exécutée au démarrage du conteneur
ENTRYPOINT ["java", "-jar", "/app.jar"]
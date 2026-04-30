pipeline {
    agent {
        docker {
            image 'my-maven-git:latest'
            args '-v $HOME/.m2:/root/.m2'
        }
    }
    stages {
        stage('Build') {
            steps {
                script {
                    // Le checkout est déjà effectué automatiquement par Jenkins en amont.
                    // Affiche le répertoire courant pour déboguer
                    def currentDir = pwd()
                    echo "Current directory: ${currentDir}"
                    sh 'ls -la'

                    // Localise le répertoire contenant le pom.xml (selon votre structure)
                    def mavenDir = null
                    if (fileExists('java-maven/maven/pom.xml')) {
                        mavenDir = 'java-maven/maven'
                    } else if (fileExists('mavenprog/pom.xml')) {
                        mavenDir = 'mavenprog'
                    } else if (fileExists('pom.xml')) {
                        mavenDir = '.'
                    } else {
                        error 'Impossible de trouver le fichier pom.xml dans les emplacements attendus.'
                    }
                    echo "Répertoire du projet Maven : ${mavenDir}"

                    // Exécute Maven puis lance le JAR généré
                    dir(mavenDir) {
                        sh 'mvn clean test package'
                        sh '''
                            JAR_FILE=$(find target -maxdepth 1 -name "*.jar" ! -name "*sources.jar" ! -name "*javadoc.jar" | head -n 1)
                            if [ -z "$JAR_FILE" ]; then
                                echo "Aucun fichier JAR exécutable trouvé dans target/."
                                echo "Contenu de target/ :"
                                ls -l target/
                                exit 1
                            fi
                            echo "Exécution de $JAR_FILE"
                            java -jar "$JAR_FILE"
                        '''
                    }
                }
            }
        }
    }
}

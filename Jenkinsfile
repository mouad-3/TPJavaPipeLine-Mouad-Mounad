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
                    def currentDir = pwd()
                    echo "Current directory: ${currentDir}"
                    sh 'ls -la'

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

                    dir(mavenDir) {
                        sh 'mvn clean test package'
                        sh '''
                            JAR_FILE=$(find target -maxdepth 1 -name "*.jar" ! -name "*sources.jar" ! -name "*javadoc.jar" | head -n 1)
                            if [ -z "$JAR_FILE" ]; then
                                echo "Aucun fichier JAR trouvé dans target/."
                                ls -l target/
                                exit 1
                            fi
                            echo "Exécution de la classe principale depuis $JAR_FILE"
                            # Exécute la classe principale sans passer par le manifest
                            java -cp "$JAR_FILE" com.tp.pipeline.App
                        '''
                    }
                }
            }
        }
    }
}

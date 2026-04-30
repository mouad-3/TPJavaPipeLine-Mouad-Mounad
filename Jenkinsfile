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
                    // Optionnel : lister les fichiers pour vérifier la structure
                    sh 'ls -la'

                    // Adaptez ce chemin selon la structure réelle de votre dépôt
                    // D'après vos logs, le dépôt contient peut-être 'mavenprog' ou 'java-maven/maven'
                    if (fileExists('java-maven/maven/pom.xml')) {
                        dir('java-maven/maven') {
                            sh 'mvn clean test package'
                            sh 'java -jar target/maven-0.0.1-SNAPSHOT.jar'
                        }
                    } else if (fileExists('mavenprog/pom.xml')) {
                        dir('mavenprog') {
                            sh 'mvn clean test package'
                            sh 'java -jar target/maven-0.0.1-SNAPSHOT.jar'
                        }
                    } else {
                        error "Impossible de trouver le fichier pom.xml. Structure du dépôt inconnue."
                    }
                }
            }
        }
    }
}

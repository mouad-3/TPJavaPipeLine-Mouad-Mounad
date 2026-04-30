pipeline {
    agent {
        docker {
            image 'my-maven-git:latest'
            args '-v $HOME/.m2:/root/.m2'
        }
    }
    stages {
        stage('Checkout') {
            steps {
                sh "rm -rf *"
                // Clone dans le répertoire courant (pas de sous-dossier supplémentaire)
                sh "git clone https://github.com/mouad-3/TPJavaPipeLine-Mouad-Mounad.git ."
            }
        }
        stage('Build') {
            steps {
                script {
                    def currentDir = pwd()
                    echo "Current directory: ${currentDir}"
                    dir('java-maven/maven') {
                        sh 'mvn clean test package'
                        sh "java -jar target/maven-0.0.1-SNAPSHOT.jar"
                    }
                }
            }
        }
    }
}

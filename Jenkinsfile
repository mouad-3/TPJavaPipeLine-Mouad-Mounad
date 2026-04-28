pipeline {
    agent any

    tools {
        // Vérifie bien que dans Jenkins (Manage Jenkins > Tools), 
        // le nom de ton installation Maven est exactement 'maven'
        maven 'maven' 
    }

    stages {
        stage('Récupération du code') {
            steps {
                echo 'Clonage du dépôt depuis GitHub...'
                checkout scm
            }
        }

       stage('Compilation & Tests') {
            steps {
                echo 'Exécution de Maven...'
                // On dit à Jenkins d'entrer dans le dossier 'mavenprog'
                dir('mavenprog') {
                    sh 'mvn clean package'
                }
            }
        }

        stage('Build Image Docker') {
            steps {
                script {
                    echo "Préparation de l'image Docker..."
                    // CORRECTION : Pour que ton TP soit complet, on lance la vraie commande.
                    // Si tu veux juste simuler, garde le echo mais attention aux apostrophes !
                    sh 'docker build -t tp-java-pipeline-mouad .'
                }
            }
        }
    }
    
    post {
        success {
            echo 'Félicitations ! La Pipeline est terminée avec succès.'
        }
        failure {
            echo 'La Pipeline a échoué. Vérifiez les logs de la console.'
        }
    }
}

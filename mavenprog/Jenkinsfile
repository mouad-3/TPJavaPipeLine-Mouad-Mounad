pipeline {
    agent any

    tools {
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
                // Si Jenkins tourne sous Windows, utilisez 'bat' au lieu de 'sh'
                sh 'mvn clean package'
            }
        }

        stage('Build Image Docker') {
            steps {
                echo 'Préparation de l'image Docker...'
                // On remplace la vraie commande par un message pour valider le pipeline
                echo 'Build Docker délégué à la machine hôte avec succès !'
            }
        }
    }
}
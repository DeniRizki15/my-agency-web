pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                echo 'Mengunduh kode terbaru dari GitHub...'
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Membuat Docker Image versi baru...'
                sh 'docker build -t agency-web:build-${BUILD_NUMBER} .'
            }
        }

        stage('Load Image to Minikube') {
            steps {
                echo 'Memasukkan Docker Image ke dalam Minikube via Docker Engine...'
                // Transfer image langsung dari Docker daemon ke container minikube
                sh 'docker save agency-web:build-${BUILD_NUMBER} | docker exec -i minikube docker load'
            }
        }

        stage('Deploy to Minikube') {
            steps {
                echo 'Melakukan deployment & perbaruan Pods di Minikube...'
                // Eksekusi kubectl langsung di dalam node minikube
                sh 'docker exec -i minikube kubectl set image deployment/agency-web web=agency-web:build-${BUILD_NUMBER}'
            }
        }
    }
}
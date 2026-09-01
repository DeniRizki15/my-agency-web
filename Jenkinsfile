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
                // Menggunakan BUILD_NUMBER Jenkins sebagai tag unik (contoh: agency-web:build-5)
                sh 'docker build -t agency-web:build-${BUILD_NUMBER} .'
            }
        }

        stage('Load Image to Minikube') {
            steps {
                echo 'Memasukkan Docker Image ke dalam Minikube...'
                // Otomatis memasukkan image yang baru di-build ke cluster Minikube
                sh 'minikube image load agency-web:build-${BUILD_NUMBER}'
            }
        }

        stage('Deploy to Minikube') {
            steps {
                echo 'Melakukan deployment & perbaruan Pods di Minikube...'
                // Apply manifest k8s
                sh 'kubectl apply -f k8s.yaml'
                // Otomatis memperbarui deployment agar menggunakan tag image terbaru
                sh 'kubectl set image deployment/agency-web web=agency-web:build-${BUILD_NUMBER}'
            }
        }
    }
}
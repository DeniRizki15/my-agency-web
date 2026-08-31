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
                echo 'Membuat Docker Image berisi HTML/CSS/JS...'
                // Membangun image agency-web:v1 langsung di lingkungan Minikube/Docker
                sh 'docker build -t agency-web:v1 .'
            }
        }
        stage('Deploy to Minikube') {
            steps {
                echo 'Menjalankan deployment ke Kubernetes...'
                sh 'kubectl apply -f k8s.yaml'
            }
        }
        stage('Verify Deployment') {
            steps {
                sh 'kubectl get pods -l app=agency-web'
                sh 'kubectl get svc agency-service'
            }
        }
    }
}

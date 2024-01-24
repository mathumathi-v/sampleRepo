pipeline {

    agent any
    stages {
        stage('Checkout') {
            steps {
                // Checkout code from GitHub
                script {
                    echo "hello"
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline succeeded!'
        }

        failure {
            echo 'Pipeline failed!'
        }
    }
}

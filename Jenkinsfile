pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "my-python-app"
        DOCKER_TAG = "${env.BUILD_ID}"
    }

    stages {
        stage('Checkout') {
            steps {
                // В реальном сценарии здесь будет git checkout
                echo 'Checking out source code...'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    echo "Building Docker image: ${DOCKER_IMAGE}:${DOCKER_TAG}"
                    // Команда для сборки (требует установленного Docker на агенте Jenkins)
                    // sh "docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} ."
                    // sh "docker tag ${DOCKER_IMAGE}:${DOCKER_TAG} ${DOCKER_IMAGE}:latest"
                }
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
                // Здесь можно добавить запуск тестов внутри контейнера
            }
        }
    }

    post {
        success {
            echo 'CI Process completed successfully!'
        }
    }
}

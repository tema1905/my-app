#!/bin/bash

# 1. Запуск Minikube (если еще не запущен)
echo "Starting Minikube..."
minikube start

# 2. Настройка окружения для использования Docker внутри Minikube
echo "Configuring Docker environment..."
# На Windows (PowerShell): & minikube -p minikube docker-env | Invoke-Expression
eval $(minikube docker-env)

# 3. Сборка образа внутри Minikube
echo "Building Docker image inside Minikube..."
docker build -t my-python-app:latest .

# 4. Удаление старого пода (если есть) и запуск нового
echo "Deploying application to Minikube..."
kubectl delete deployment my-python-app --ignore-not-found
kubectl create deployment my-python-app --image=my-python-app:latest
kubectl expose deployment my-python-app --type=NodePort --port=5000

# 5. Ожидание запуска
echo "Waiting for pod to be ready..."
kubectl wait --for=condition=ready pod -l app=my-python-app --timeout=60s

# 6. Получение URL приложения
echo "Application is ready!"
minikube service my-python-app --url

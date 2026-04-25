#!/bin/bash

echo "--- Deploying TodoApp Infrastructure ---"

# 1. Створюємо оточення
kubectl apply -f namespace.yml

# 2. Створюємо сховище (PV та PVC)
kubectl apply -f pv.yml
kubectl apply -f pvc.yml

# 3. Створюємо конфігурації
kubectl apply -f confgiMap.yml
kubectl apply -f secret.yml

# 4. Запускаємо сервіси та застосунок
kubectl apply -f clusterIp.yml
kubectl apply -f nodeport.yml
kubectl apply -f deployment.yml

echo "--- Deployment finished! ---"
kubectl get pods -n todoapp

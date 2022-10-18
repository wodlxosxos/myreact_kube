#!/bin/sh

kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
kubectl apply -f ingress.yaml

minikube addons enable ingress
minikube addons enable metrics-server

kubectl apply -f hpa.yaml

#!/bin/bash

aws eks update-kubeconfig --region ap-south-1 --name supermario-eks

kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

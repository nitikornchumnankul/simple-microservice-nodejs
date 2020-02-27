# !/bin/bash
# Flagger takes a Kubernetes deployment and optionally a horizontal pod autoscaler (HPA), 
# then creates a series of objects (Kubernetes deployments, ClusterIP services, 
# Istio destination rules and virtual services). These objects expose the application inside the mesh and drive the canary analysis and promotion.
# Create a test namespace with Istio sidecar injection enabled:
kubectl create ns test
kubectl label namespace test istio-injection=enabled

# Create a deployment and a horizontal pod autoscaler:
kubectl apply -k github.com/weaveworks/flagger//kustomize/podinfo
# Deploy the load testing service to generate traffic during the canary analysis:
kubectl apply -k github.com/weaveworks/flagger//kustomize/tester


# Create a canary custom resource (replace example.com with your own domain):
kubectl apply -f ./podinfo-canary.yaml

# When the canary analysis starts, 
# Flagger will call the pre-rollout webhooks before routing traffic to the canary. 
# The canary analysis will run for five minutes while validating the HTTP metrics and rollout hooks every minute.
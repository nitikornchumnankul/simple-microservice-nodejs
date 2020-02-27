# !/bin/bash
# Create a test namespace with Istio sidecar injection enabled:

kubectl create ns test
kubectl label namespace test istio-injection=enabled


# Create a deployment and a horizontal pod autoscaler:
kubectl apply -k github.com/weaveworks/flagger//kustomize/podinfo

# Deploy the load testing service to generate traffic during the canary analysis:
kubectl apply -k github.com/weaveworks/flagger//kustomize/tester

# resource as podinfo-abtest.yaml and apply it:
kubectl apply -f ./podinfo-abtest.yaml

# After a couple of seconds Flagger will create the canary objects:

# applied 
# deployment.apps/podinfo
# horizontalpodautoscaler.autoscaling/podinfo
# canary.flagger.app/podinfo

# generated 
# deployment.apps/podinfo-primary
# horizontalpodautoscaler.autoscaling/podinfo-primary
# service/podinfo
# service/podinfo-canary
# service/podinfo-primary
# destinationrule.networking.istio.io/podinfo-canary
# destinationrule.networking.istio.io/podinfo-primary
# virtualservice.networking.istio.io/podinfo




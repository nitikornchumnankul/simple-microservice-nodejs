# !/bin/bash
kubectl -n test set image deployment/podinfo \
podinfod=stefanprodan/podinfo:3.1.1

# Flagger detects that the deployment revision changed and starts a new rollout:
kubectl -n test describe canary/podinfo

# Note that if you apply new changes to the deployment during the canary analysis, Flagger will restart the analysis.
# A canary deployment is triggered by changes in any of the following objects:
# Deployment PodSpec (container image, command, ports, env, resources, etc)
# ConfigMaps mounted as volumes or mapped to environment variables
# Secrets mounted as volumes or mapped to environment variables
# You can monitor all canaries with:
watch kubectl get canaries --all-namespaces

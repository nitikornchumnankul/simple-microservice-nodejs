# !/bin/bash
#------------------------------------------------------------------
# Automated canary promotion
# Trigger a canary deployment by updating the container image:
kubectl -n test set image deployment/abtest \
podinfod=stefanprodan/podinfo:3.1.1

# Flagger detects that the deployment revision changed and starts a new rollout:
kubectl -n test describe canary/abtest

# Note that if you apply new changes to the deployment during the canary analysis, Flagger will restart the analysis.
# You can monitor all canaries with:
watch kubectl get canaries --all-namespaces
# !/bin/bash
# During the canary analysis you can generate HTTP 500 errors and high latency to test if Flagger pauses the rollout.
# Trigger another canary deployment:
kubectl -n test set image deployment/podinfo \
podinfod=stefanprodan/podinfo:3.1.2

# Exec into the load tester pod with:
kubectl -n test exec -it flagger-loadtester-xx-xx sh

# Generate HTTP 500 errors:
watch curl http://podinfo-canary:9898/status/500

# Generate latency:
watch curl http://podinfo-canary:9898/delay/1

# When the number of failed checks reaches the canary analysis threshold, 
# the traffic is routed back to the primary, the canary is scaled to zero and the rollout is marked as failed.
kubectl -n test describe canary/podinfo

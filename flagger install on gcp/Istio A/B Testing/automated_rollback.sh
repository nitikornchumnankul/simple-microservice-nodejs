# !/bin/bash

# During the canary analysis you can generate HTTP 500 errors and high latency to test Flagger's rollback.
# Generate HTTP 500 errors:
watch curl -b 'type=insider' http://app.example.com/status/500

# Generate latency:
watch curl -b 'type=insider' http://app.example.com/delay/1
# When the number of failed checks reaches the canary analysis threshold, 
# the traffic is routed back to the primary, the canary is scaled to zero and the rollout is marked as failed.
kubectl -n test describe canary/abtest

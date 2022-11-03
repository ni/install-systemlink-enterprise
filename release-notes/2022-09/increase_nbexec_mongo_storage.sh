# Solution 1.
# Specify helm release name
RELEASE_NAME=dev-systemlink
# Specify namespace where the systemlink helm was installed
NAMESPACE=systemlink-enterprise

# Patch PersistentVolumeClaims with new size
kubectl patch pvc/datadir-$RELEASE_NAME-nbexecservice-mongodb-0 -p='{"spec": {"resources": {"requests": {"storage": "50Gi"}}}}' -n $NAMESPACE
kubectl patch pvc/datadir-$RELEASE_NAME-nbexecservice-mongodb-1 -p='{"spec": {"resources": {"requests": {"storage": "50Gi"}}}}' -n $NAMESPACE
kubectl patch pvc/datadir-$RELEASE_NAME-nbexecservice-mongodb-2 -p='{"spec": {"resources": {"requests": {"storage": "50Gi"}}}}' -n $NAMESPACE

# Delete sts but leave pods alive
kubectl delete sts --cascade=orphan $RELEASE_NAME-nbexecservice-mongodb -n $NAMESPACE

# Upgrade helm
# helm upgrade systemlink

# restart mongo
kubectl rollout restart sts $RELEASE_NAME-nbexecservice-mongodb -n $NAMESPACE

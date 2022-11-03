# Solution 2.
# Alternative, delete pvc
# Specify helm release name
RELEASE_NAME=dev-systemlink
# Specify namespace where the systemlink helm was installed
NAMESPACE=systemlink-enterprise

# Delete sts and PVC
kubectl delete sts $RELEASE_NAME-nbexecservice-mongodb -n $NAMESPACE
kubectl delete pvc/datadir-$RELEASE_NAME-nbexecservice-mongodb-0 -n $NAMESPACE
kubectl delete pvc/datadir-$RELEASE_NAME-nbexecservice-mongodb-1 -n $NAMESPACE
kubectl delete pvc/datadir-$RELEASE_NAME-nbexecservice-mongodb-2 -n $NAMESPACE

# helm upgrade systemlink

# Restart mongo
kubectl rollout restart sts $RELEASE_NAME-nbexecservice-mongodb -n $NAMESPACE

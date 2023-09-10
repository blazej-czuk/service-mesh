# Deploy to kubernetes
```bash
export DRONES_COUNT=4
k apply -f kubernetes/service.yaml -f kubernetes/deployment.yaml
export POD_NAME=$(kubectl get pods --namespace default -o jsonpath="{.items[0].metadata.name}")
export SVC_NAME=$(kubectl get svc --namespace default -o jsonpath="{.items[0].metadata.name}")
kubectl port-forward svc/$SVC_NAME 8080
kubectl exec $POD_NAME -- echo $DRONES_COUNT




sudo ip route add 10.98.55.0/24 via 10.0.0.11 dev vboxnet0
# Zainicjowanie ingres-gateway
kubectl apply -f ingress-gateway-http.yml
# Utworzenie dostępu do 3 dronów po nazwach DNS
kubectl apply -f virtual-service-ingress-gateway-fqdn.yml
# Loadbalancing
kubectl apply -f virtual-service-ingress-gateway-loadbalancing.yml
# Mirror
kubectl apply -f virtual-service-ingress-gateway-mirror.yml


```

# ConfigMaps
```bash
https://www.aquasec.com/cloud-native-academy/kubernetes-101/kubernetes-configmap/
kubectl get configmaps special-config -o yaml

```
```yaml
# example manifest:
apiVersion: v1
kind: ConfigMap
metadata:
  name: special-config
  namespace: default
data:
  DRONES_NUMBER: "4"
#
```

    

# Show containers envs:
```bash
kubectl exec dron1-7c984c46f6-tpvqv -- echo $DRONES_COUNT
kubectl exec dron1-7c984c46f6-tpvqv -- printenv
```


# Patch deploymnet dron1
kubectl patch deployment dron4 --patch "$(cat patch.yaml)"

kubectl patch deploy/dron4 --patch "$(cat patch.yaml)"

kubectl rollout undo deploy/dron4





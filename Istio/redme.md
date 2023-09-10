# Run Kiali
    kubectl port-forward svc/kiali -n istio-system 20001
    http://127.0.0.1:20001/kiali/console/

# Disable enable drons
```bash
# zakomentuj 5 drona    

# Graficzna prezentacja dronów i ich komunikacji (wymiany informacji) między sobą.
k apply -f deployment.yaml
k apply -f dron-services.yaml
k delete -f deployment.yaml 
k delete -f dron-services.yaml
```
    
# Kontakt z dronami z ziemi
```bash
sudo ip route add 10.98.55.0/24 via 10.0.0.11 dev vboxnet0
# Zainicjowanie ingres-gateway
kubectl apply -f ingress-gateway-http.yml
# Utworzenie dostępu do 3 dronów po nazwach DNS
kubectl apply -f virtual-service-ingress-gateway-fqdn.yml
# Loadbalancing
kubectl apply -f virtual-service-ingress-gateway-loadbalancing.yml
# Mirror
kubectl apply -f virtual-service-ingress-gateway-mirror.yml



k apply -f drony-gateway.yml
k delete -f drony-gateway.yml

# Chcemy się dostać do kokpitu drona.
http://kube.home/dron4/
# Chcemy się przywitać czy wysyłać rozkazy, polecenia
curl http://kube.home/dron3/siemka
curl http://kube.home/dron3/version

##  działa tylko wewnątrz sieci.
http://kube.home/dron4/ping-me  


watch curl kube.home/dron1/siemka
watch curl kube.home/dron3/siemka
```

# Dodanie drona5 aby wysyłał rozkazy do drona4
```bash
# odkomentuj workload dron5 w deployment.yaml i service dron5 w dron-services.yaml
# i pamiętaj odkomentować komunikację zwrtoną w service/dron3  

k apply -f deployment.yaml
k apply -f dron-services.yaml
```
# Zablokuj możliwość komunikacji z drona5 do drona3
```bash
k apply -f vs-drony.yaml
k delete -f vs-drony.yaml

# Polityki wewnątrz
kubectl exec dron1-79f975bfcb-8tpzw -- curl http://dron3:3000/siemka

kubectl exec -it dron2-754ff7c75c-rdm9g -- curl http://dron2:3000/ping-me

curl http://dron3:3000/ping-me -H "content-type: application/json; charset=utf-8" -H "dron: dron1" --d '{"from": "dron1"}'

curl http://mirror.kube.home/ping-me -H "content-type: application/json; charset=utf-8" -H "dron: dron1" --b '{"from": "dron1"}'

kubectl exec -it dron2-754ff7c75c-rdm9g -- bash

# mirror.kube.home ping-me
 curl -H 'Content-Type: application/json' \
      -d '{"from":"blazej"}' \
      -X POST \
      http://mirror.kube.home/ping-me

# mirror.kube.home siemka
 curl -H 'Content-Type: application/json' \
      -X GET \
      http://mirror.kube.home/siemka

# dron2.kube.home ping-me
 curl -H 'Content-Type: application/json' \
      -d '{"from":"blazej"}' \
      -X POST \
      http://dron2.kube.home/ping-me

# dron3.kube.home siemka -H "dron: dron2"
 curl -H 'Content-Type: application/json' -H "dron: dron1" -X GET \
      http://dron3.kube.home/siemka

# dron3.kube.home siemka -H "dron: dron2"
 curl -H 'Content-Type: application/json' -H "dron: dron2" -X GET \
      http://dron3.kube.home/siemka

# dron2.kube.home siemka
 curl -H 'Content-Type: application/json' \
      -X GET \
      http://dron2.kube.home/siemka



# Replikacja dronów
https://www.youtube.com/watch?v=I4L2aR80_nQ

k scale --replicas=3 deployment dron4
watch -x kubectl get pods



k scale --replicas=1 deployment dron4



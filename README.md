# Tunnel - Container for port tunneling

## Use with k8s

```bash
# destination ip
IP=192.168.0.5

# destination port
PORT=80

# pod name
NAME=web

# create pod
kubectl run $NAME --privileged=true --env IP=$IP --env PORT=$PORT --image=cloudtips/tunnel

# export nodeport
kubectl expose pod $NAME --type=NodePort --name=$NAME --port=$PORT

# execute port-forward in local computer
kubectl port-forward svc/$NAME --address 127.0.0.1 $PORT:$PORT

# test connection port foward
telnet 127.0.0.1 $PORT
```

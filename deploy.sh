docker build -t gbrezeanu00/multi-client-k8s:latest -t gbrezeanu00/multi-client-k8s:$SHA -f ./client/Dockerfile ./client
docker build -t gbrezeanu00/multi-server-k8s-pgfix:latest -t gbrezeanu00/multi-server-k8s-pgfix:$SHA -f ./server/Dockerfile ./server
docker build -t gbrezeanu00/multi-worker-k8s:latest -t gbrezeanu00/multi-worker-k8s:$SHA -f ./worker/Dockerfile ./worker

docker push gbrezeanu00/multi-client-k8s:latest
docker push gbrezeanu00/multi-server-k8s-pgfix:latest
docker push gbrezeanu00/multi-worker-k8s:latest

docker push gbrezeanu00/multi-client-k8s:$SHA
docker push gbrezeanu00/multi-server-k8s-pgfix:$SHA
docker push gbrezeanu00/multi-worker-k8s:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=gbrezeanu00/multi-server-k8s-pgfix:$SHA
kubectl set image deployments/client-deployment client=gbrezeanu00/multi-client-k8s:$SHA
kubectl set image deployments/worker-deployment worker=gbrezeanu00/multi-worker-k8s:$SHA
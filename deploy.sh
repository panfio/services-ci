docker build -t $DOCKERHUB_USERNAME/ci-client:latest -t $DOCKERHUB_USERNAME/ci-client:$GIT_SHA -f ./client/Dockerfile ./client
docker build -t $DOCKERHUB_USERNAME/ci-server:latest -t $DOCKERHUB_USERNAME/ci-server:$GIT_SHA -f ./server/Dockerfile ./server
docker build -t $DOCKERHUB_USERNAME/ci-worker:latest -t $DOCKERHUB_USERNAME/ci-worker:$GIT_SHA -f ./worker/Dockerfile ./worker

docker push $DOCKERHUB_USERNAME/ci-client:latest
docker push $DOCKERHUB_USERNAME/ci-server:latest
docker push $DOCKERHUB_USERNAME/ci-worker:latest

docker push $DOCKERHUB_USERNAME/ci-client:$GIT_SHA
docker push $DOCKERHUB_USERNAME/ci-server:$GIT_SHA
docker push $DOCKERHUB_USERNAME/ci-worker:$GIT_SHA
#sleep 1.5s
kubectl apply -f fibk8s
kubectl set image deployments/server-deployment server=$DOCKERHUB_USERNAME/ci-server:$GIT_SHA
kubectl set image deployments/client-deployment client=$DOCKERHUB_USERNAME/ci-client:$GIT_SHA
kubectl set image deployments/worker-deployment worker=$DOCKERHUB_USERNAME/ci-worker:$GIT_SHA

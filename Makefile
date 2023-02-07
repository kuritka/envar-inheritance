
PRINTER=./envar-inheritance-printer
CALLER=./envar-inheritance-caller
IMAGE=kuritka/envar-inheritance-caller:124
REPOSITORY=docker.io
CLUSTER=demo
init:
	k3d cluster delete demo
	k3d cluster create demo
	kubectl create namespace demo
	cd $(PRINTER) && CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build
	cd $(CALLER) && CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build

redeploy:
	docker build . -t $(IMAGE)
	k3d image import $(IMAGE) -c $(CLUSTER)
	kubectl delete -f deployment.yaml && kubectl apply -f deployment.yaml

include colima.mk
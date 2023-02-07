
PRINTER=./envar-inheritance-printer
CALLER=./envar-inheritance-caller
IMAGE=local.io/test/envar-inheritance-caller:latest
CLUSTER=k8gb-test-eu
init:
	cd $(PRINTER) && go build
	cd $(CALLER) && go build

redeploy:
	docker build . -t $(IMAGE)
	k3d image import $(IMAGE) -c $(CLUSTER)
	# kubectl scale deployment envar-inheritance-caller --replicas=0 --context=k3d-$(CLUSTER)
	kubectl apply -f deployment.yaml --context=k3d-$(CLUSTER)
	kubectl scale deployment envar-inheritance-caller --replicas=1 --context=k3d-$(CLUSTER)


list:
	kubectl get pods -n demo --context=k3d-k8gb-test-us
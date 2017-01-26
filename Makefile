help:
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

# --------------------------------------------------------
# Cluster maintenance
creds:                    ## Populates database secrets
	@kubectl create secret generic ao-creds \
		--from-literal=pg_user=$(AO_PG_USER) \
	  --from-literal=pg_pwd=$(AO_PG_PWD)

hm-charts:
	@helm package ao-k8s/charts/ao-db
	@helm package ao-k8s/charts/ao-ui
	@mv *.tgz charts
	@helm repo index --url http://127.0.0.1:8879 charts

hm-serv:                  ## Launch local helm chart server
	@helm serve --repo-path charts &

nuke: ao-down db-down

# --------------------------------------------------------
# AO application tasks
ao-up:                    ## Launch AO ui and svc
	@helm install local/ao-ui -f ao-k8s/ao-ui.yml -n ao-ui --replace

ao-down:                  ## Terminate ui and svc
	@helm del ao-ui --purge 1>&-

ao-restart: down up       ## Restarts ui and svc

ao-update:                ## Refresh charts recipes
	@helm upgrade ao-ui local/ao-ui -f ao-k8s/ao-ui.yml 1>&-

ao-open:                  ## Launch the ui in a browser
	@minikube service ao-ui

# --------------------------------------------------------
# Db Tasks
db-up:                    ## Launch the database
	@helm install local/ao-db -f ao-k8s/ao-db.yml -n ao-db --replace

db-down:                  ## Terminate the database
	@helm del ao-db --purge 1>&-

db-restart: db-down db-up ## Restarts the db

db-update:                ## Update db recipes
	@helm upgrade ao-db local/ao-db -f a0-k8s/ao-db.yml 1>&-

https://roadmap.sh/projects/monitoring

## Installing in k8s cluster

Most common way to setup monitoring stack in production environment

### Prometheus and Grafana

0. Install Helm
```
sudo apt-get install helm
```

1. Add Helm repo
```
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
```

2. Update Helm repos
```
helm repo update
```

3. Install Prometheus stack in cluster
```
helm install prometheus prometheus-community/kube-prometheus-stack \
  --namespace monitoring \
  --create-namespace
```

4. Get your Grafana admin password
```
kubectl --namespace monitoring get secrets prometheus-grafana -o jsonpath="{.data.admin-password}" | base64 -d ; echo
```

5. Check if everything works properly
```
kubectl get all -n monitoring
```

6. Port-forward Grafana web UI to your machine
```
export POD_NAME=$(kubectl --namespace monitoring get pod -l "app.kubernetes.io/name=grafana,app.kubernetes.io/instance=prometheus" -oname)
kubectl --namespace monitoring port-forward $POD_NAME 3000
```

7. Go to `http://localhost:3000` to access Grafana UI

### Go server

1. Build and push to Docker hub (check workflow example in `./.github/workflows`)

2. Install Helm chart
```
helm upgrade --install pingserver ./pingserver/ -n app --create-namespace
```

3. Metrics from server should automatically be exported to Prometheus

4. Create new dashboard in Grafana and add query: `rate(ping_request_count[1m])`

5. Port-forward Go servers endpoint to your machine
```
kubectl port-forward pod/<your-pingserver-pod-name> 8080:8090 -n app
```

6. Go to `http://localhost/8080/ping` a few times (or curl)

7. You'll see a graph in Grafana changing (if not - enable auto refresh)


## [DON'T DO IT, IT'S INPRACTICAL] Setting up Prometheus locally by hand

If you just want to run Prometheus on a bare metal server, you can install and run Prometheus and Grafana locally

- Download and untar Prometheus files from the official website
- Download and untar Node exporter files from the official website
- Download and install deb package for Grafana from the official website, then start/enable it as systemd service

1. Run Prometheus with custom config
```
/path/to/prometheus --config.file=prometheus_files/prometheus.yml
```

2. Run Node exporter
```
/path/to/node_exporter --web.listen-address 127.0.0.1:8080
```

3. Build and run a Go server
```
go mod tidy
go run server.go
```

4. Go to localhost:9090/query

5. Type query: `rate(ping_request_count[1m])`
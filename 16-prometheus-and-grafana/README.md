https://roadmap.sh/projects/monitoring

1. 
```
/path/to/prometheus --config.file=prometheus_files/prometheus.yml
```

2. 
```
/path/to/node_exporter --web.listen-address 127.0.0.1:8080
```

3. 
```
go mod tidy
go run server.go
```

4. Go to localhost:9090/query
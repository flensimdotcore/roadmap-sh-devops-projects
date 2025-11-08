https://roadmap.sh/projects/multi-container-service

# Health check
```
curl http://localhost:3000/health
```

# Get all to-dos
```
curl http://localhost:3000/todos
```

# Create new to-do
```
curl -X POST http://localhost:3000/todos \
  -H "Content-Type: application/json" \
  -d '{"title": "Test Todo", "description": "This is a test todo"}'
```

# Get to-do by id
```
curl http://localhost:3000/todos/:id
```

# Update to-do
```
curl -X PUT http://localhost:3000/todos/:id \
  -H "Content-Type: application/json" \
  -d '{"completed": true}'
```

# Delete to-do
```
curl -X DELETE http://localhost:3000/todos/:id
```

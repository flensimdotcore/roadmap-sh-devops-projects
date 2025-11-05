
### Usage

1. Using locally:
```
ansible-playbook -i inventory.yml node_service.yml -vvvv --tags app -e "image_tag=<YOUR_IMAGE_TAG>"
```

2. Using in CI:
Just push to main branch, and it will start automatically

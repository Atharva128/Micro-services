
# Simple Production Platform

Stack:
- Terraform
- AWS EKS
- GitHub Actions
- Docker
- Kubernetes
- Microservices (Node.js)

## Services
- user-service
- order-service

## CI/CD
GitHub Actions:
- Build Docker images
- Push to ECR
- Deploy to EKS

## Deploy

### Terraform
```bash
cd terraform
terraform init
terraform apply
```

### Kubernetes
```bash
kubectl apply -f k8s/
```

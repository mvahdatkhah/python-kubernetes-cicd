# 🐍 Python App on Kubernetes with GitLab CI/CD 🚀

Welcome to **Python App** — a containerized Python project with full **CI/CD automation**, running on **Kubernetes** and packaged via **Nexus private registry**.  
This repo is DevOps-ready 💪 with linting, testing, builds, deployments, and cleanup jobs.

---

## ✨ Features
- 🐳 **Multi-stage Docker builds** for optimized images  
- ✅ **Linting & Testing** with `flake8` and `pytest`  
- 🤖 **Automated CI/CD pipeline** powered by GitLab  
- ☸️ **Kubernetes manifests** for seamless deployments  
- 🔐 **Private Docker registry support** (Nexus)  
- 🧹 **Automatic cleanup** of old images (keep last 5 + latest)  

---

## 📂 Project Structure
```
.
├── .gitlab-ci.yml        # CI/CD pipeline definition
├── ci/                   # CI scripts (e.g., test.yml)
├── k8s/                  # Kubernetes manifests
├── Dockerfile            # Python app container
├── requirements.txt      # Python dependencies
├── .gitignore
├── .dockerignore
└── README.md             # This file 😎
```

---

## ⚡ Quickstart

### 🔨 Build & Run Locally
```bash
# Build the Docker image
docker build -t python-app:local .

# Run the app
docker run -p 8000:8000 python-app:local
```

### 🧪 Run Tests
```bash
pip install -r requirements.txt
pytest -q
flake8 .
```

---

## 🚀 CI/CD Pipeline Overview
The GitLab pipeline consists of **4 stages**:

1. **Build** 🏗️ – Build & push Docker image to Nexus  
2. **Test** 🧪 – Run unit tests & linting  
3. **Deploy** ☸️ – Deploy app to Kubernetes (`dev` branch → dev namespace, `main` → prod namespace)  
4. **Cleanup** 🧹 – Remove old images from registry  

---

## 📊 Pipeline Diagram (Mermaid)

```bash
flowchart LR
    A[🏗️ Build] --> B[🧪 Test]
    B --> C{Branch/Tag?}
    C -->|dev branch| D[☸️ Deploy Dev]
    C -->|main branch or tag| E[☸️ Deploy Prod]
    E --> F[🧹 Cleanup (manual)]
```
---

## ☸️ Kubernetes Deployment

Manifests are in the `k8s/` directory:
- `deployment.yaml` 🛠️ – App deployment  
- `service.yaml` 📡 – Cluster service  
- `ingress.yaml` 🌐 – External ingress with NGINX  
- `configmap.yaml` ⚙️ – App configs  
- `secret.yaml` 🔐 – App secrets  
- `serviceaccount.yaml` 🧑‍💻 – Service account for pods  

---

## 🔐 Registry Setup

This project uses **Nexus** as Docker registry.  
Make sure to create a Kubernetes secret for authentication:

```bash
kubectl create secret docker-registry regcred   --docker-server=registry.sepehrtv.org   --docker-username=$REGISTRY_USER   --docker-password=$REGISTRY_PASS   --namespace=node-app
```

---

## 🌍 Environments
- **Dev**: [https://python-dev.sepehrtv.org](https://python-dev.sepehrtv.org)  
- **Prod**: [https://python.sepehrtv.org](https://python.sepehrtv.org)  

---

## 🛠️ Tech Stack
- 🐍 Python 3.12  
- 🐳 Docker  
- ☸️ Kubernetes  
- 🎛️ Nexus Registry  
- 🤖 GitLab CI/CD  

---


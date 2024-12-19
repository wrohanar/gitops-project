# 🚀 GitOps Web App Deployment with Kubernetes, ECR, and ArgoCD

Welcome to the **GitOps Web App** project! 🎉 This is a Kubernetes-based web application that uses **ArgoCD**, **Flux**, and **Amazon ECR** for continuous delivery and deployment automation.

## 🛠️ Project Overview

This project automates the deployment of a web application on **Amazon EKS** using **GitOps**. The setup includes:

- **Amazon ECR** for Docker image management.
- **Kubernetes** for orchestration and container management.
- **ArgoCD** for continuous delivery.
- **Flux** for GitOps-based deployment.

### Features:
- **Auto-deploys** on `main` branch changes.
- Scalable architecture using **Kubernetes**.
- Fully automated using **GitHub Actions**.
- Easily customizable for your own projects!

---

## 🚀 Quick Start

### Prerequisites:

Before you dive into the action, make sure you have:

1. **AWS Account** - Set up with the necessary permissions.
2. **Amazon EKS Cluster** - Ready and accessible.
3. **AWS CLI** & **kubectl** - Installed locally for interacting with your cluster.
4. **Docker** - Installed locally for building and pushing images.

### Set up Secrets:
Ensure the following secrets are stored in GitHub:
- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `AWS_REGION`
- `AWS_ACCOUNT_ID`
- `KUBE_CONFIG`

### Step 1: Clone the repository

```bash
git clone https://github.com/yourusername/gitops-web-app.git
cd gitops-web-app

```
## Step 2: Set up AWS and Kubernetes Configurations

Ensure that the necessary configurations are set in the secrets section of your repository.

### AWS Credentials
These credentials are needed for authentication with **ECR** and for managing your **Amazon EKS** cluster. Store the following secrets in GitHub:
- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `AWS_REGION`
- `AWS_ACCOUNT_ID`

### Kubeconfig for Kubernetes Access
Add the `KUBE_CONFIG` secret to your GitHub repository to provide Kubernetes access using **kubectl**.

---

## 🔧 CI/CD Workflow

This project uses **GitHub Actions** for automated deployments.

### Workflow Breakdown:

1. **Checkout code**: The pipeline starts by checking out the latest code from the repository.
2. **Set up AWS credentials**: Configures AWS access using the secrets you’ve provided.
3. **ECR Repository**: Ensures the **ECR repository** exists. If not, it will be created automatically.
4. **Docker Image Build**: The **Docker image** for the app is built using the `Dockerfile` provided in the repo.
5. **Push to ECR**: After building, the image is tagged and pushed to your **ECR repository**.
6. **Kubernetes Deployment**: The app is deployed to your **EKS cluster** using `kubectl` and the YAML files for deployment and service.
7. **ArgoCD Integration**: ArgoCD watches the repository and ensures the desired state is always deployed in the cluster.

### Workflow Trigger:

- **On every push** to the `main` branch.
- **Manually** via `workflow_dispatch`.

---

## 🌐 Accessing the App

After the deployment is successful, Kubernetes will provision an External Load Balancer. 🎉

### How to Access:

1. Run the following command to get the **External IP** of the LoadBalancer:
   ```bash
   kubectl get svc

   ```

2. Open a browser and navigate to the provided IP to view your deployed application!

## ⚠️ Troubleshooting

## Common Issues:

**EC2 Instances Creating Every Time:** This can happen if the Auto-Scaling Group is misconfigured or your CI/CD pipeline is inadvertently triggering instance creation. Double-check your Auto-Scaling Group settings in AWS and ensure your pipeline isn’t provisioning new resources unnecessarily.

**CrashLoopBackOff:** If the pods are stuck in a CrashLoopBackOff, it might be due to missing configurations or incorrect Docker image paths. Check your deployment.yaml for proper image references.

**ImagePullBackOff:** If the image fails to pull, ensure that the image is correctly pushed to ECR and that the permissions for accessing it are properly set.

## 📈 Monitoring & Debugging

**Check Kubernetes logs:**

```bash
kubectl logs <pod-name> --previous
```
**View Kubernetes cluster info:**

```bash
kubectl cluster-info
```
**View services and pods:**

```bash
kubectl get svc
kubectl get pods
```
## 📝 License
This project is licensed under the MIT License - see the LICENSE file for details.

## 👨‍💻 Contributing
If you want to contribute, feel free to fork this repository, create a branch, make your changes, and submit a pull request!

## 💬 Support
Got questions? Feel free to open an issue or contact me directly.

## Happy coding! 👨‍💻🎉

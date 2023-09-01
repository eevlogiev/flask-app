<a name="readme-top"></a>


<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/eevlogiev/flask-app">
    <img src="images/devops.svg" alt="Logo" width="800" height="200">
  </a>

<h3 align="center">Flask App Project</h3>

  <p align="center">
    Simple Flask Project
    <br />
    <a href="https://github.com/eevlogiev/flask-app"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/eevlogiev/flask-app">View Demo</a>
    ·
    <a href="https://github.com/eevlogiev/flask-app/issues">Report Bug</a>
    ·
    <a href="https://github.com/eevlogiev/flask-app/issues">Request Feature</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#tools-and-technologies-used">Tools Used</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

This project uses Terraform to build an environment in AWS (VPC, subnets, EC2 instnces, ECR, IAM roles, etc) and then EKS cluster on top of that. It also creates a Jenkins server where via pipeline Flask application is being deployed. Deployment creates flask application running on NGINX server on Kubernetes pod and K8s addons like external-dns and cert-manager for creating SSL certificates and dynamically updating DNS entries in Route53 for specific domain.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



### Tools and Technologies used

* [![AWS][AWS]][AWS-url]
* [![Terraform][Terraform]][Terraform-url]
* [![Docker][Docker]][Docker-url]
* [![Kubernetes][Kubernetes]][Kubernetes-url]
* [![Helm][Helm]][Helm-url]
* [![Jenkins][Jenkins]][Jenkins-url]
* [![Python][Python]][Python-url]
* [![Flask][Flask]][Flask-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

This is an example of how you may give instructions on setting up your project locally.
To get a local copy up and running follow these simple example steps.

### Prerequisites

In order to execute this project user must have AWS account with proper privileges.

Also the following tools and packages must be installed:
1. AWS CLI
2. Terraform
3. Git



### Installation

1. Clone the repo
   ```
   git clone https://github.com/eevlogiev/flask-app.git
   ```
2. Go to /infra/terraform
3. Configure your AWS credentials by adding Access key and Secret key:
   ```
   aws configure
   ```
4. Deploy the infrastructure in AWS:
   ```
   terraform apply
   ```
2. Clone the repo
   ```sh
   git clone https://github.com/github_username/repo_name.git
   ```
4. Login to Jenkins on EC2 public IP and port 8080
5. Configure your Githhub private SSH key in Jenkins
6. Create MultiBranch Pipeline, pointing to your Github repo and the configured Github credentials

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## Usage

TBD

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTACT -->
## Contact

Evelin Evlogiev - [![LinkedIn][linkedin-shield]][linkedin-url]

Project Link: [https://github.com/eevlogiev/flask-app](https://github.com/eevlogiev/flask-app)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* [Nik Vaklinov](https://github.com/nvaklinov/nvaklinov)


<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://www.linkedin.com/in/e-evlogiev/
[product-screenshot]: images/screenshot.png
[AWS]: https://img.shields.io/badge/AWS-FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white
[AWS-url]: https://aws.amazon.com/
[Terraform]: https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white
[Terraform-url]: https://www.terraform.io/
[Docker]: https://img.shields.io/badge/docker-0db7ed.svg?style=for-the-badge&logo=docker&logoColor=white
[Docker-url]: https://www.docker.com/
[Kubernetes]: https://img.shields.io/badge/kubernetes-326ce5.svg?style=for-the-badge&logo=kubernetes&logoColor=white
[Kubernetes-url]: https://kubernetes.io/
[Helm]: https://img.shields.io/badge/helm-%230F1689?style=for-the-badge&logo=helm
[Helm-url]: https://helm.sh/
[Jenkins]: https://img.shields.io/badge/jenkins-%232C5263.svg?style=for-the-badge&logo=jenkins&logoColor=white
[Jenkins-url]: https://www.jenkins.io/
[Python]: https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54
[Python-url]: https://www.python.org/
[Flask]: https://img.shields.io/badge/flask-%23000.svg?style=for-the-badge&logo=flask&logoColor=white
[Flask-url]: https://flask.palletsprojects.com/en/2.3.x/


#!/bin/bash
       
#####JENKINS#######
yum update -y
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
yum upgrade -y
sudo dnf install java-11-amazon-corretto -y
yum install jenkins git -y

#######DOCKER############
yum install -y docker
systemctl start docker
systemctl enable docker
usermod -aG docker jenkins
systemctl enable jenkins
systemctl start jenkins
     
####KUBECTLandHELM######
curl -LO https://dl.k8s.io/release/v1.27.3/bin/linux/amd64/kubectl
install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
curl -L https://git.io/get_helm.sh | bash -s -- --version v3.8.2
      
######CONFIG########
aws eks update-kubeconfig --region us-east-1 --name "flask-cluster"
mkdir /var/lib/jenkins/.kube/
cp ~/.kube/config /var/lib/jenkins/.kube/
chown -R jenkins: /var/lib/jenkins/
chmod 600 /var/lib/jenkins/.kube/config

echo 'OUT=$(aws sts assume-role --role-arn arn:aws:iam::389224572829:role/eks-role --role-session-name AWSCLI-Session) \
&& export AWS_ACCESS_KEY_ID=$(echo $OUT | jq -r '.Credentials''.AccessKeyId') \
&& export AWS_SECRET_ACCESS_KEY=$(echo $OUT | jq -r '.Credentials''.SecretAccessKey') \
&& export AWS_SESSION_TOKEN=$(echo $OUT | jq -r '.Credentials''.SessionToken') \
&& export AWS_DEFAULT_REGION="us-east-1" \
&& aws sts get-caller-identity' > /var/lib/jenkins/assume_role.sh
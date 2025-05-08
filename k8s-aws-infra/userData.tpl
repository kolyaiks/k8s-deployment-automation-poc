#!/usr/bin/env bash

#update system
yum update -y

#installing Jenkins
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade
sudo yum install java-17-amazon-corretto -y
sudo yum install jenkins -y
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins

#installing docker
sudo yum install -y docker
sudo systemctl enable docker

#install git
sudo yum install git -y

# install kubectl
sudo curl -LO "https://dl.k8s.io/release/${kubectl_version}/bin/linux/amd64/kubectl"
sudo chmod +x ./kubectl
sudo mkdir -p $HOME/bin && sudo cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin
#!/bin/bash

set -e
exec >> (tee /var/log/user-data.log | logger -t user-data -s 2>/dev/console) 2>&1

echo "===== Starting EC2 bootstrap ====="
# --------------------------------------------------
# 1. Update RHEL
# --------------------------------------------------

dnf update -y

# --------------------------------------------------
# 2. Install basic packages
# --------------------------------------------------

dnf install -y wget curl git unzip tar fontconfig

# --------------------------------------------------
# 3. Install Ansible
# --------------------------------------------------

dnf install -y ansible-core

echo "Ansible installed:"
ansible --version

# --------------------------------------------------
# 4. Install Java 21 & jenkins
# --------------------------------------------------

wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/rpm-stable/jenkins.repo
yum upgrade

# Add required dependencies for the jenkins package
sudo yum install -y fontconfig java-21-openjdk
sudo yum install -y jenkins

echo "Java installed:"
java -version

# --------------------------------------------------
# 5. Enable Jenkins at boot
# --------------------------------------------------

systemctl daemon-reload
systemctl enable jenkins
systemctl start jenkins

# --------------------------------------------------
# 6. Verify Jenkins
# --------------------------------------------------

echo "Jenkins status:"
systemctl --no-pager status jenkins || true

echo "===== Bootstrap completed ====="

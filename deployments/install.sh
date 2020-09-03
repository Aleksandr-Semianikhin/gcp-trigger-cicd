sudo yum -y update

sudo yum -y install yum-utils device-mapper-persistent-data lvm2

sudo yum -y remove docker-client docker-common docker

sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

yum install -y https://download.docker.com/linux/centos/7/x86_64/stable/Packages/containerd.io-1.2.6-3.3.el7.x86_64.rpm
	
sudo yum -y install docker-ce docker-ce-cli

sudo systemctl start docker
sudo systemctl enable docker

sudo docker run -d -p 8081:8081 --name nexus sonatype/nexus3	

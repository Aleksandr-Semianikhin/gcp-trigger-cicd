sudo yum -y update

sudo yum -y install yum-utils device-mapper-persistent-data lvm2

sudo yum -y remove docker-client docker-common docker

sudo yum-config-manager --add-repo 
https://download.docker.com/linux/centos/docker-ce.repo
	
sudo yum -y install docker-ce

sudo systemctl start docker
sudo systemctl enable docker

sudo docker run -d -p 8081:8081 --name nexus sonatype/nexus3	

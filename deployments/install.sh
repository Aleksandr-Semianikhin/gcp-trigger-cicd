sudo yum install -y yum-utils

sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
	
sudo yum install docker-ce docker-ce-cli containerd.io

sudo systemctl start docker

docker run -d -p 8081:8081 --name nexus sonatype/nexus3	

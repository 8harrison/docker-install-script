
sudo apt-get remove docker* containerd runc

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
  | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io

sudo groupadd docker

echo "Continuar instalação? s/n"

read continue;

if [ "$contine" = "s" ];
then

	sudo usermod -aG docker $USER

	newgrp docker

	sudo systemctl status docker

	sudo systemctl start docker

	sudo systemctl enable docker

	docker run hello-world
fi

# Falta:
# tomcat 
# limpeza do tar.gz eclipse
# melhorando logs
# customizar git
# customizar mvn

$script_app_basic = <<-SCRIPT
  apt-get -y install maven && \
  apt-get -y install nodejs && \
  apt-get -y install npm && \
  apt-get -y install openjdk-11-jdk && \
  apt-get -y install git
  git config --global http.sslVerify false
SCRIPT

$script_vscode = <<-SCRIPT
  apt install curl && \
  curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg && \
  mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg && \
  echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list && \
  apt-get -y update &&  apt-get -y install code
SCRIPT

$script_eclipse = <<-SCRIPT
  wget http://eclipse.c3sl.ufpr.br/technology/epp/downloads/release/2019-03/R/eclipse-java-2019-03-R-linux-gtk-x86_64.tar.gz && \
  tar xfz eclipse-java-2019-03-R-linux-gtk-x86_64.tar.gz -C /opt/
SCRIPT

$script_docker = <<-SCRIPT
echo iniciando docker && \
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && \
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable" && \
apt-get update && \
apt-get -y install docker-ce
SCRIPT

$script_kubernetes = <<-SCRIPT
echo iniciando kubernetes && \
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
chmod +x ./kubectl && \
sudo mv ./kubectl /usr/local/bin/kubectl && \
echo fim kubernetes
SCRIPT


$script_chrome = <<-SCRIPT
echo iniciando chrome && \
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' && \
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add - && \
apt-get update && \
apt-get install google-chrome-stable && \
echo fim chrome
SCRIPT

Vagrant.configure("2") do |config|

  config.vm.box = "jwatson3d/linuxmint19-xfce"
  config.vm.synced_folder "/shared", "/shared"
  config.vm.provider "virtualbox" do |v|
    v.gui = true
    v.name = "development_workstation"
    v.memory = 8192
    v.cpus = 3
    v.customize ["modifyvm", :id, "--vram", "64"]

    config.vm.provision "shell", inline: $script_app_basic

    config.vm.provision "shell", inline: $script_vscode
    
    config.vm.provision "shell", inline: $script_eclipse

    config.vm.provision "shell", inline: $script_docker

    config.vm.provision "shell", inline: $script_kubernetes

    config.vm.provision "shell", inline: $script_chrome

  end

end
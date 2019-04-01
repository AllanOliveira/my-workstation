# Falta Eclipse / Docker / kubernetes / imagem base melhor

$script_puppet = <<-SCRIPT
  apt-get update && \
  apt-get install -y puppet && \
  puppet module install puppetlabs-apt
SCRIPT

$script_vscode = <<-SCRIPT
  apt install curl && \
  curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg && \
  mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg && \
  echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list && \
  apt update && apt install code
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.box = "offensive-security/kali-linux-light"
  
  config.vm.provider "virtualbox" do |v|
    v.gui = true
    v.name = "development_workstation"
    v.memory = 8192
    v.cpus = 2
    v.customize ["modifyvm", :id, "--vram", "48"]

    config.vm.provision "shell", inline: $script_puppet

    config.vm.provision "shell", inline: $script_vscode
    
    config.vm.provision "puppet" do |puppet|
      puppet.manifests_path = "./configs/puppet"
      puppet.manifest_file = "programs.pp"
    end

  end

end
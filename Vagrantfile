$script_puppet = <<-SCRIPT
  apt-get update && \
  apt-get install -y puppet && \
  puppet module install puppetlabs-apt
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.box = "offensive-security/kali-linux-light"
  #testart mazenovi/linuxmint

  config.vm.provider "virtualbox" do |v|
    v.gui = true
    v.name = "development_workstation"
    v.memory = 8192
    v.cpus = 2
    v.customize ["modifyvm", :id, "--vram", "48"]

    config.vm.provision "shell", inline: $script_puppet
    
    config.vm.provision "puppet" do |puppet|
      puppet.manifests_path = "./configs/puppet"
      puppet.manifest_file = "programs.pp"
    end

  end

end
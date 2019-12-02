

Vagrant.configure('2') do |config|
  if Vagrant.has_plugin?('vagrant-vbguest')
    config.vbguest.auto_update = false
  end

  config.vm.box = 'ubuntu/bionic64'
  config.vm.synced_folder '.', '/home/vagrant/dotfiles'

  config.vm.provider :virtualbox do |vbox|
    vbox.memory = '1028'
  end

  config.vm.provision 'shell', inline: <<-SHELL
    apt update
    add-apt-repository ppa:neovim-ppa/unstable
    apt update
    apt install nodejs npm python3-pip neovim -y
    su - vagrant -c ./dotfiles/install-ubuntu.sh
  SHELL

end

Vagrant.configure("2") do |config|
  config.vm.box = "archlinux/archlinux"
  config.vm.provision :shell, :path => "provision.core.sh"
  config.vm.provision :shell, :path => "provision.aur.sh", :privileged => false
  config.vm.provider "virtualbox" do |v|
    # Display the VirtualBox GUI when booting the machine
    v.gui = true
    # Customize the amount of cpu and memory on the VM:
    v.cpus = 4
    v.memory = "10240"
    # Enable sound support
    # (available options for audiocontroller: "hda" for Linux host, "sb16", "ac97" for Windows host)
    # (available options for audio: "alsa" or "pulse" for Linux host, "dsound" for Windows host, "coreaudio" for Mac OS)
    v.customize ["modifyvm", :id, '--audiocontroller', 'ac97']
    # Customize video memory
    v.customize ["modifyvm", :id, "--vram", "128"]
  end
end


VAGRANTFILE_API_VERSION = "2"

cluster = {
  "discovery1" => { :groups => ["zookeeper"], :ip => "192.168.17.10", :cpus => 2, :mem => 2048 },
  "discovery2" => { :groups => ["zookeeper"], :ip => "192.168.17.20", :cpus => 2, :mem => 2048 },
  "discovery3" => { :groups => ["zookeeper"], :ip => "192.168.17.30", :cpus => 2, :mem => 2048 },
  "worker1"    => { :groups => [], :ip => "192.168.17.100", :cpus => 4, :mem => 6144 }
  "worker2"    => { :groups => [], :ip => "192.168.17.110", :cpus => 4, :mem => 6144 }
  "worker3"    => { :groups => [], :ip => "192.168.17.120", :cpus => 4, :mem => 6144 }
}

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  cluster.each_with_index do |(hostname, info), index|
    
    config.vm.define hostname do |cfg|
      cfg.vm.hostname = hostname
      cfg.vm.box = "ubuntu/artful64"
  
      cfg.vm.network :private_network, ip: "#{info[:ip]}"
      
      cfg.vm.provider :virtualbox do |vb|
        vb.linked_clone = true
        vb.name = hostname
        vb.cpus = info[:cpus]
        vb.memory = info[:mem]
        vb.customize ["modifyvm", :id, "--ostype", "Ubuntu_64"]
        vb.customize ["modifyvm", :id, "--pagefusion", "on"]
        vb.customize ["modifyvm", :id, "--hwvirtex", "on"]
      end # end provider
    end # end config
    
  end # end cluster

  # Use :ansible or :ansible_local to
  # select the provisioner of your choice
  config.vm.provision :ansible do |ansible|
    ansible.playbook = "provisioning/playbook.yml"
  end # end config

end


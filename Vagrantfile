dir = File.dirname(File.expand_path(__FILE__))

require 'yaml'

configFile = YAML.load_file("#{dir}/config.yaml")

configData = configFile['config']

#Vagrant.require_version '>= 1.6.0'

Vagrant.configure('2') do |config|
	config.vm.box = "ubuntu/xenial64"


	# set hostname
	if configData['hostname'].to_s.strip.length != 0
		config.vm.hostname = "#{configData['hostname']}"
	else
		config.vm.hostname = "project.local.dev"
	end


	# set ip adress
	config.vm.network "private_network", ip: "192.168.42.200"

	# set forwarded ports
	config.vm.network "forwarded_port", guest: 22, host: 22
	config.vm.network "forwarded_port", guest: 80, host: 80
	config.vm.network "forwarded_port", guest: 443, host: 443
	config.vm.network "forwarded_port", guest: 9200, host: 9200


	# set config virtualbox
	config.vm.provider :virtualbox do |virtualbox|
		virtualbox.customize ['modifyvm', :id, '--name', "#{configData['hostname']}"]
		virtualbox.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
		virtualbox.customize ['modifyvm', :id, '--memory', "#{configData['vm']['memory']}"]
		virtualbox.customize ['modifyvm', :id, '--cpus', "#{configData['vm']['cpus']}"]
	end


	# provision via shell
	config.vm.provision :shell, :path => "provision.sh"

	
	config.vm.post_up_message = "Your machine is ready"
end
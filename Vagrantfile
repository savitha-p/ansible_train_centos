# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
#    config.vm.define "ansiblehost" do |ansiblehost|
#    ansiblehost.vm.provider :ansible do |ansible|
#    ansible.machine_virtual_size = 500
#    ansible.cpus = 8
#    ansible.cputopology :sockets => '2', :cores => '2', :threads => '1'
#    ansible.memory = 10240
#    end
#  # The most common configuration options are documented and commented below.
#  # For a complete reference, please see the online documentation at
#  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
#  ansiblehost.vm.box = "generic/centos7"
#  ansiblehost.vm.hostname = "ansible"
#  ansiblehost.vm.network "public_network", :type => "bridge", :dev => "br0", :ip => "172.172.3.230", :netmask => "255.255.255.0", :gateway => "172.172.3.1"
#  ansiblehost.vm.network "public_network", :type => "bridge", :dev => "virbr2", :ip => "10.10.10.3", :netmask => "255.255.255.0", :gateway => "10.10.10.1"
#  ansiblehost.vm.provision :shell, :path => "enable-root-login.sh"
#  ansiblehost.vm.provision :shell, :path => "ansdeps"
#  ansiblehost.vm.provision :reload
#  ansiblehost.vm.provision :shell, :path => "ansgit"
#  ansiblehost.vm.provision :shell, :path => "sshpass"
  # SHELL
#  end

#####################controller configuration#####################


    config.vm.define "controller" do |controller|
    controller.vm.provider :libvirt do |controller|
    controller.machine_virtual_size = 200
    controller.cpus = 8
    controller.cputopology :sockets => '4', :cores => '2', :threads => '1'
    controller.memory = 51200
    end
  controller.vm.box = "generic/centos7"
  controller.vm.hostname = "controller"
  controller.vm.network "public_network", :type => "bridge", :dev => "br0", :ip => "172.172.3.231", :netmask => "255.255.255.0", :gateway => "172.172.3.1"
  controller.vm.network "public_network", :type => "bridge", :dev => "virbr2", :ip => "10.10.10.4", :netmask => "255.255.255.0", :gateway => "10.10.10.1"
  controller.vm.network "public_network", :type => "bridge", :dev => "br0", auto_config: true, use_dhcp_assigned_default_route: true
  controller.vm.network "public_network", :type => "bridge", :dev => "virbr2", auto_config: true, use_dhcp_assigned_default_route: true
  controller.vm.network "public_network", :type => "bridge", :dev => "virbr2", :ip => "10.10.10.5", :netmask => "255.255.255.0", :gateway => "10.10.10.1"
  controller.vm.provision :shell, :path => "enable-root-login.sh"
  controller.vm.provision :shell, :path => "targetdeps"
  controller.vm.provision :shell, :path => "controllerbridge"
  controller.vm.provision :shell, :path => "disksize"
  controller.vm.provision "shell",run: "always",inline: "sed -i '/SELINUX=enforcing/c SELINUX=disabled' /etc/sysconfig/selinux"
  controller.vm.provision :reload
  controller.vm.provision "shell",run: "always",inline: "setenforce 0"
  end

###########################compute configuration#########################
   config.vm.define "compute" do |compute|
    compute.vm.provider :libvirt do |compute|
    compute.machine_virtual_size = 200
    compute.cpus = 8
    compute.cputopology :sockets => '4', :cores => '2', :threads => '1'
    compute.memory = 10240
    end
  compute.vm.box = "generic/centos7"
  compute.vm.hostname = "compute"
  compute.vm.network "public_network", :type => "bridge", :dev => "br0", :ip => "172.172.3.232", :netmask => "255.255.255.0", :gateway => "172.172.3.1"
  compute.vm.network "public_network", :type => "bridge", :dev => "virbr2", :ip => "10.10.10.6", :netmask => "255.255.255.0", :gateway => "10.10.10.1"
  compute.vm.network "public_network", :type => "bridge", :dev => "virbr2", auto_config: true, use_dhcp_assigned_default_route: true
  compute.vm.network "public_network", :type => "bridge", :dev => "virbr2", auto_config: true, use_dhcp_assigned_default_route: true
  compute.vm.network "public_network", :type => "bridge", :dev => "virbr2", :ip => "10.10.10.7", :netmask => "255.255.255.0", :gateway => "10.10.10.1"
  compute.vm.provision :shell, :path => "enable-root-login.sh"
  compute.vm.provision :shell, :path => "targetdeps"
  compute.vm.provision :shell, :path => "computebridge"
  compute.vm.provision :shell, :path => "disksize"
  compute.vm.provision "shell",run: "always",inline: "sed -i '/SELINUX=enforcing/c SELINUX=disabled' /etc/sysconfig/selinux"   
  compute.vm.provision :reload
  compute.vm.provision "shell",run: "always",inline: "setenforce 0"   
  end

##########################cephmon configuration#########################
  config.vm.define "mon" do |mon|
    mon.vm.provider :libvirt do |mon|
    mon.cpus = 8
    mon.cputopology :sockets => '4', :cores => '2', :threads => '1'
    mon.memory = 10240
    end
  mon.vm.box = "generic/centos7"
  mon.vm.hostname = "mon"
  mon.vm.network "public_network", :type => "bridge", :dev => "br0", :ip => "172.172.3.233", :netmask => "255.255.255.0", :gateway => "172.172.3.1"
  mon.vm.network "public_network", :type => "bridge", :dev => "virbr2", :ip => "10.10.10.8", :netmask => "255.255.255.0", :gateway => "10.10.10.1"
  mon.vm.network "public_network", :type => "bridge", :dev => "virbr2", :ip => "10.10.10.9", :netmask => "255.255.255.0", :gateway => "10.10.10.1"
  mon.vm.provision :shell, :path => "enable-root-login.sh"
  mon.vm.provision :shell, :path => "targetdeps"
  mon.vm.provision :shell, :path => "monbridge"
  mon.vm.provision :reload
  end
##########################osd1 configuration#########################
  config.vm.define "osd1" do |osd1|
   osd1.vm.provider :libvirt do |osd1|
    osd1.cpus = 8
    osd1.storage :file, :size => '200G', :type => 'raw'
    osd1.cputopology :sockets => '4', :cores => '2', :threads => '1'
    osd1.memory = 10240
    end
  osd1.vm.box = "generic/centos7"
  osd1.vm.hostname = "osd1"
  osd1.vm.network "public_network", :type => "bridge", :dev => "br0", :ip => "172.172.3.234", :netmask => "255.255.255.0", :gateway => "172.172.3.1"
  osd1.vm.network "public_network", :type => "bridge", :dev => "virbr2", :ip => "10.10.10.10", :netmask => "255.255.255.0", :gateway => "10.10.10.1"
  osd1.vm.network "public_network", :type => "bridge", :dev => "virbr2", :ip => "10.10.10.11", :netmask => "255.255.255.0", :gateway => "10.10.10.1"
  osd1.vm.provision :shell, :path => "enable-root-login.sh"
  osd1.vm.provision :shell, :path => "targetdeps"
  osd1.vm.provision :shell, :path => "osd1bridge"
  osd1.vm.provision :reload
  end
##########################osd2 configuration#########################
  config.vm.define "osd2" do |osd2|
    osd2.vm.provider :libvirt do |osd2|
    osd2.cpus = 8
    osd2.storage :file, :size => '200G', :type => 'raw'
    osd2.cputopology :sockets => '4', :cores => '2', :threads => '1'
    osd2.memory = 10240
    end
  osd2.vm.box = "generic/centos7"
  osd2.vm.hostname = "osd2"
  osd2.vm.network "public_network", :type => "bridge", :dev => "br0", :ip => "172.172.3.235", :netmask => "255.255.255.0", :gateway => "172.172.3.1"
  osd2.vm.network "public_network", :type => "bridge", :dev => "virbr2", :ip => "10.10.10.12", :netmask => "255.255.255.0", :gateway => "10.10.10.1"
  osd2.vm.network "public_network", :type => "bridge", :dev => "virbr2", :ip => "10.10.10.13", :netmask => "255.255.255.0", :gateway => "10.10.10.1"
  osd2.vm.provision :shell, :path => "enable-root-login.sh"
  osd2.vm.provision :shell, :path => "targetdeps"
  osd2.vm.provision :shell, :path => "osd2bridge"
  osd2.vm.provision :reload
  end
###########################osd3 configuration#########################
  config.vm.define "osd3" do |osd3|
    osd3.vm.provider :libvirt do |osd3|
    osd3.cpus = 8
    osd3.storage :file, :size => '200G', :type => 'raw'
    osd3.cputopology :sockets => '4', :cores => '2', :threads => '1'
    osd3.memory = 10240
    end
  osd3.vm.box = "generic/centos7"
  osd3.vm.hostname = "osd3"
  osd3.vm.network "public_network", :type => "bridge", :dev => "br0", :ip => "172.172.3.236", :netmask => "255.255.255.0", :gateway => "172.172.3.1"
  osd3.vm.network "public_network", :type => "bridge", :dev => "virbr2", :ip => "10.10.10.14", :netmask => "255.255.255.0", :gateway => "10.10.10.1"
  osd3.vm.network "public_network", :type => "bridge", :dev => "virbr2", :ip => "10.10.10.15", :netmask => "255.255.255.0", :gateway => "10.10.10.1"
  osd3.vm.provision :shell, :path => "enable-root-login.sh"
  osd3.vm.provision :shell, :path => "targetdeps"
  osd3.vm.provision :shell, :path => "osd3bridge"
  osd3.vm.provision :reload
  end
##########################iscsi configuration#########################
  config.vm.define "iscsi" do |iscsi|
    iscsi.vm.provider :libvirt do |iscsi|
    iscsi.cpus = 8
    iscsi.storage :file, :size => '200G', :type => 'raw'
    iscsi.cputopology :sockets => '4', :cores => '2', :threads => '1'
    iscsi.memory = 10240
    end
  iscsi.vm.box = "generic/centos7"
  iscsi.vm.hostname = "iscsi"
  iscsi.vm.network "public_network", :type => "bridge", :dev => "br0", :ip => "172.172.3.237", :netmask => "255.255.255.0", :gateway => "172.172.3.1"
  iscsi.vm.network "public_network", :type => "bridge", :dev => "virbr2", :ip => "10.10.10.16", :netmask => "255.255.255.0", :gateway => "10.10.10.1"
  iscsi.vm.network "public_network", :type => "bridge", :dev => "virbr2", :ip => "10.10.10.17", :netmask => "255.255.255.0", :gateway => "10.10.10.1"
  iscsi.vm.provision :shell, :path => "enable-root-login.sh"
  iscsi.vm.provision :shell, :path => "targetdeps"
  iscsi.vm.provision :shell, :path => "iscsibridge"
  iscsi.vm.provision :reload
  iscsi.vm.provision :shell, :path => "iscsipvcreate"
 end
###############################ansible host#########################
 config.vm.define "ansiblehost" do |ansiblehost| 
    ansiblehost.vm.provider :libvirt do |ansible|
    ansible.machine_virtual_size = 200
    ansible.cpus = 8
    ansible.cputopology :sockets => '2', :cores => '4', :threads => '1'
    ansible.memory = 10240
    end
  ansiblehost.vm.box = "generic/centos7"
  ansiblehost.vm.hostname = "ansible"
  ansiblehost.vm.network "public_network", :type => "bridge", :dev => "br0", :ip => "172.172.3.230", :netmask => "255.255.255.0", :gateway => "172.172.3.1"
  ansiblehost.vm.network "public_network", :type => "bridge", :dev => "virbr2", :ip => "10.10.10.3", :netmask => "255.255.255.0", :gateway => "10.10.10.1"
  ansiblehost.vm.provision :shell, :path => "enable-root-login.sh"
  ansiblehost.vm.provision :shell, :path => "ansdeps"
  ansiblehost.vm.provision :shell, :path => "disksize"
  ansiblehost.vm.provision :reload
  ansiblehost.vm.provision :shell, :path => "ansgit"
  ansiblehost.vm.provision :shell, :path => "sshpass"
  ansiblehost.vm.provision :shell, :path => "openstackdeployment"
  end
end

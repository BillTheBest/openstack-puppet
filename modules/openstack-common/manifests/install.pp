class openstack-common::install {

  apt::source { "openstack-nova-trunk":
    location => "http://ppa.launchpad.net/nova-core/trunk/ubuntu",
    release => "maverick",
    repos => "main",
    key => "2A2356C9",
    key_server => "keyserver.ubuntu.com",
    #pin => "1",
    notify => Exec["apt-update"]
  }

  apt::source { "openstack-glance-trunk":
    location => "http://ppa.launchpad.net/glance-core/trunk/ubuntu",
    release => "maverick",
    repos => "main",
    key => "2085FE8D",
    key_server => "keyserver.ubuntu.com",
    #pin => "1",
    notify => Exec["apt-update"]
  }

  apt::source { "openstack-keystone-trunk":
    location => "http://ppa.launchpad.net/keystone-core/trunk/ubuntu",
    release => "maverick",
    repos => "main",
    key => "9D5FC90B",
    key_server => "keyserver.ubuntu.com",
    #pin => "1",
    notify => Exec["apt-update"]
  }

  exec { "apt-update":
    command => "/usr/bin/apt-get update",
    require => [ Apt::Source["openstack-nova-trunk"],
                 Apt::Source["openstack-glance-trunk"],
		 Apt::Source["openstack-keystone-trunk"] ],
    refreshonly => true
  }

}

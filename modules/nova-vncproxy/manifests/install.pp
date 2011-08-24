class nova-vncproxy::install {
  require "nova-common"
  
  package { "nova-vncproxy":
    ensure => latest,
    require => [
      Apt::Source["openstack-nova-trunk"],
      Package["nova-novnc"],
    ]
  }

  package { "nova-novnc":
    ensure => latest,
    notify => Service["nova-vncproxy"],
    require => [
      Apt::Source["openstack-nova-trunk"],
    ]
  }

  file { "/etc/init/nova-vncproxy.conf":
    source  => "puppet:///modules/nova-vncproxy/nova-vncproxy.conf",
    notify => Service["nova-vncproxy"]
  }
}

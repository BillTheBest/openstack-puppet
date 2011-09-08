class nova-scheduler::install {

  package { "nova-scheduler":
    ensure => latest,
    require => [
      Apt::Source["openstack-nova-trunk"],
      Service["rabbitmq-server"],
      Service["mysql"]
    ]
  }

}
  

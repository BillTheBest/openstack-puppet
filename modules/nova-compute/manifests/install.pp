class nova-compute::install {
  require "nova-common"
  
  package { "nova-compute":
    ensure => latest,
    require => Apt::Source["openstack-nova-trunk"]
  }
  
}

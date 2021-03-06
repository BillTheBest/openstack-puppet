class glance::install {
  # TODO: Remove python-xattr once it is in glance packaging
  $glance_packages = [ "glance", "python-glance" ]

  package { "python-xattr":
    ensure => present
  }

  # ha configs require synced uid/gid
  user { "glance":
    ensure  => present,
    uid     => 504,
    gid     => 65534,
    home    => "/var/lib/glance",
    shell   => "/bin/bash"
  }
  
  package { $glance_packages:
    ensure => latest,
    notify => [Service["nova-api"]],
    require => [
      Apt::Source["openstack-glance-trunk"],
      Package["nova-common"],
      Package["python-xattr"],
      User["glance"]
    ]
  }

  file { "/var/log/glance":
    ensure => directory,
    owner  => "glance",
    mode   => 0755,
    require => [Package["glance"], Package["python-glance"]]
  }

  file { "/var/log/glance/api.log":
    ensure => present,
    owner  => "glance",
    mode   => 0600,
    require => File["/var/log/glance"]
  }

}
  

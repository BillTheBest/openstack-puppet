class nova-reserve-ip::install {

  package { "mysql-client":
    ensure  => latest,
  }

  exec { "reserve_ip":
    command     => "mysql -h${mysql_vip} -unova -p${mysql_nova_password} nova -e \"update fixed_ips set host='`hostname`' where address='${host_vmnet_ip}'\"",
    path        => [ "/bin", "/usr/bin" ],
    unless      => "test `hostname` == `mysql -h{mysql_vip} -unova -p${mysql_nova_password} nova -e \"select host from fixed_ips where address='${host_vmnet_ip}'\"`",
    require     => Package["mysql-client"],
  }
}


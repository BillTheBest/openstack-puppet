class nova-api::service {

  service { "nova-api":
    ensure    => running,
    enable    => true,
    require   => [
      File["nova-default"],
      File["nova-api-paste.ini"]
    ],
    subscribe => File["/etc/nova/nova.conf"]
  }
  
}

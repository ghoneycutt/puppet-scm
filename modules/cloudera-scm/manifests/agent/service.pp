class cloudera-scm::agent::service {
  service { "cloudera-scm-agent":
    ensure    => running,
    enable    => true,
    require   => [ Package["cloudera-scm-agent"], File["scm-config.ini"] ],
    subscribe => File["scm-config.ini"],
  }
}

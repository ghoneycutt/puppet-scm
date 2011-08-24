class scm::server::service {
  if ($scm::server::params::krb_enabled) {
    $requires = [ Package["cloudera-scm-server"], Package["mysql-connector-java"], 
                  Exec["scm-install-schema"], Service["mysqld"], 
                  Class["java::jce-unlimited-policy"] ]
  } else {
    $requires = [ Package["cloudera-scm-server"], Package["mysql-connector-java"], 
                  Exec["scm-install-schema"], Service["mysqld"] ]
  }
  service { "cloudera-scm-server":
    ensure  => running,
    enable  => true,
    require => $requires,
  }
}

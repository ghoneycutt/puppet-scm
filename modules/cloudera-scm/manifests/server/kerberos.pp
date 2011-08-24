class scm::server::kerberos {
  $realm = $scm::server::params::krb_realm
  $keytab = "/etc/cloudera-scm-server/cmf.keytab"

  kerberos::principal { "scm/admin@$realm":
    keytab  => $keytab,
    require => Package["cloudera-scm-server"],
  }
  file { $keytab:
    owner   => "cloudera-scm",
    group   => "cloudera-scm",
    mode    => "600",
    require => [ Kerberos::Principal["scm/admin@$realm"], 
                 Package["cloudera-scm-server"] ],
    notify  => Service["cloudera-scm-server"],
  } 
  file { "/etc/cloudera-scm-server/cmf.principal":
    content => "scm/admin@$realm\n",
    owner   => "cloudera-scm",
    group   => "cloudera-scm",
    mode    => "600",
    require => Package["cloudera-scm-server"],
    notify  => Service["cloudera-scm-server"],
  }
}

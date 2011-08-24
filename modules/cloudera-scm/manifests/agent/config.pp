class cloudera-scm::agent::config {
  file { "scm-config.ini":
    path    => "/etc/cloudera-scm-agent/config.ini",
    content => template("cloudera-scm/scm-config.ini.erb"),
    require => Package["cloudera-scm-agent"],
  }
}

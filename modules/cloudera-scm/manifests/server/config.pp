class scm::server::config {
  exec { "scm-install-schema":
    command => "/usr/share/cmf/schema/scm_prepare_mysql.sh '$scm::server::params::mysql_db' '$scm::server::params::mysql_user' '$scm::server::params::mysql_pass'",
    require => [ Package["cloudera-scm-server"], Service["mysqld"] ],
    unless  => "/usr/bin/mysqlcheck -s '$scm::server::params::mysql_db'"
  }
}

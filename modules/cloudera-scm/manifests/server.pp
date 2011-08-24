class cloudera-scm::server {
  include cloudera-scm::server::params
  include cloudera-scm::server::config
  include cloudera-scm::server::install
  include cloudera-scm::server::service

  if ($cloudera-scm::server::params::krb_enabled) {
    include cloudera-scm::server::kerberos
  }
}

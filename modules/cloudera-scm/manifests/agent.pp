class cloudera-scm::agent {
  include cloudera-scm::agent::params
  include cloudera-scm::agent::config
  include cloudera-scm::agent::install
  include cloudera-scm::agent::service
}

class scm::server::install {
  package { "cloudera-scm-server":
    ensure  => latest,
    require => Yumrepo["Cloudera-enterprise"],
  }
}

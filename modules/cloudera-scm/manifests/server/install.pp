class cloudera-scm::server::install inherits cloudera-scm::server::params {
  package { $package_names:
    ensure  => latest,
  }
}

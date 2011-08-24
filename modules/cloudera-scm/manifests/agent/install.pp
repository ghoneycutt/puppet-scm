class cloudera-scm::agent::install inherits cloudera-scm::agent::params {
  package { $package_names:
    ensure  => latest,
  }
}

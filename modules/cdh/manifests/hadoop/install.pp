class cdh::hadoop::install inherits cdh::hadoop::params {
  package { $package_names:
    ensure => latest,
  }
}

class hadoop::install inherits hadoop::params {
  package { $package_names:
    ensure => latest,
  }
}

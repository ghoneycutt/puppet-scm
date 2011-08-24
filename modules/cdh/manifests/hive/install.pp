class cdh::hive::install inherits cdh::hive::params {
  package { $package_names: 
    ensure => latest,
  }
}

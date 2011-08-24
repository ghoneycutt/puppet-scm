class cdh::zookeeper::install inherits cdh::zookeeper::params {
  package { $package_names:
    ensure => latest,
  } 
}

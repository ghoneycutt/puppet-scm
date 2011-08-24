class cdh::hbase::install inherits cdh::hbase::params {
  package { $package_names: 
    ensure => latest,
  }
}

class hadoop-hbase::install inherits hadoop-hbase::params {
  package { $package_names: 
    ensure => latest,
  }
}

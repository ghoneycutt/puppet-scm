# 
#  Copyright (c) 2011, Cloudera, Inc. All Rights Reserved. 
# 
#  Cloudera, Inc. licenses this file to you under the Apache License, 
#  Version 2.0 (the "License"). You may not use this file except in 
#  compliance with the License. You may obtain a copy of the License at 
# 
#      http://www.apache.org/licenses/LICENSE-2.0 
# 
#  This software is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR 
#  CONDITIONS OF ANY KIND, either express or implied. See the License for 
#  the specific language governing permissions and limitations under the 
#  License. 
# 

class cloudera-hue::engine::config inherits cloudera-hue::engine::params {
  file { "/etc/hue/hue.ini":
    content => template('cloudera-hue/hue.ini.erb'),
    mode    => "644",
    owner   => "root",
    group   => "root",
    require => [ Package[$package_names], Exec["hue-init-db"] ],
    notify  => Service["hue"],
  }

  exec { "hue-init-db":
    command     => "/usr/local/bin/hue_init_db.sh '$db_name' '$db_user' '$db_pass'",
    require     => File["/usr/local/bin/hue_init_db.sh"],
    unless      => "/usr/bin/mysqlcheck -s '$db_name'",
    refreshonly => true,
    subscribe   => Package["hue"],
  }

  file { "/usr/local/bin/hue_init_db.sh":
    source => "puppet:///modules/cloudera-hue/hue_init_db.sh",
    mode   => "755",
    owner  => "root",
    group  => "root",
  }

  if ($enterprise) {
    exec { "hue-cmon-init-db":
      command     => "/usr/local/bin/hue_init_db.sh '$cmon_db_name' '$db_user' '$db_pass'",
      require     => File["/usr/local/bin/hue_init_db.sh"],
      unless      => "/usr/bin/mysqlcheck -s '$cmon_db_name'",
      refreshonly => true,
      subscribe   => Package["hue-cmon"],
    }
  
    file { "/etc/hue/cmon.conf":
      content => template("cloudera-hue/cmon.conf.erb"),
      mode    => "644",
      owner   => "root",
      group   => "root",
      require => [ Package[$package_names], Exec["hue-cmon-init-db"] ],
      notify  => Service["hue"],
    }
  }
}

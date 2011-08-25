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

class cloudera-hue::engine::params (
  $hue_host, $hue_http_port, $secret_key, 
  $namenode_host, $namenode_port, $namenode_thrift_port,
  $jobtracker_host, $jobtracker_thrift_port,
  $enterprise=false, $firehose_port=undef,
  $timezone=$timezone,
  $flume_master_host=undef, $flume_master_port=undef)
{
  if ($enterprise) {
    $package_list = [ "hue", "hue-common", "hue-flume", "hue-beancounter", "hue-cmon",
                      "hue-cloudera-libs" ]
  } else { 
    $package_list = [ "hue", "hue-common" ]
  }
}

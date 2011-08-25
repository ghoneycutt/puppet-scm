# Puppet module for Cloudera HUE

## Description
Contains classes to install and configure the HUE server, as well as the associated hadoop plugins.  Can optionally configure CMON support in HUE.

## Usage

### cloudera-hue::hadoop-plugins
<pre>
class { 'cloudera-hue::hadoop-plugins::params':
  enterprise    => true,
  hue_host      => "hue-server.fakedomain",
  firehose_port => 9999,
}
include cloudera-hue::hadoop-plugins
</pre>

### cloudera-hue::engine

<pre>
class { 'cloudera-hue::engine::params':
  hue_host               => "hue-server.fakedomain",
  hue_http_port          => 8088,
  secret_key             => "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
  namenode_host          => "cluster01.fakedomain",
  namenode_port          => 8020,
  namenode_thrift_port   => 10090,
  jobtracker_host        => "cluster01.fakedomain",
  jobtracker_thrift_port => 9290,
  enterprise             => true,
  firehose_port          => 9999,
}
include cloudera-hue::engine
</pre>

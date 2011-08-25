# Puppet module for Cloudera Service and Configuration Manager

## Description
Installs and configures the agent and server components of Cloudera SCM.

## Usage

### cloudera-scm::agent
<pre>
class { 'cloudera-scm::agent::params':
  server_host => 'scm-host.fakedomain',
  server_port => 7182,
}
include cloudera-scm::agent
</pre>

### cloudera-scm::server
Currently (as of 2011.08.25), only install support is implemented.

<pre>
include cloudera-scm::server::install
</pre>

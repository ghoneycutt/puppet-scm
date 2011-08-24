class scm::server::params ($mysql_user, $mysql_pass, $mysql_db = "cloudera_scm",
                           $krb_realm = undef) {
  $krb_enabled = $krb_realm ? {
    undef   => false,
    default => true,
  }
}

class role::rgbank::web {
  include profile::common
  include profile::git
  include profile::nginx
  include profile::mysql::client

  $db_address = puppetdb_query("
    facts[value] {
      name = \"ipaddress\" and certname in inventory[certname] {
        trusted.extensions.pp_application = \"${trusted['extensions']['pp_application']}\" and
        trusted.extensions.pp_cluster = \"${trusted['extensions']['pp_cluster']}\" and
        trusted.extensions.pp_role = \"DatabaseNode\"
      }
    }
  ")[0]['value']

  class { 'profile::rgbank::web':
    db_name     => 'rgbank',
    db_user     => 'rgbank',
    db_password => 'rgbankPassw0rd',
    db_host     => $db_address,
  }

}

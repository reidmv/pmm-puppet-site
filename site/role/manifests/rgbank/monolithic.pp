class role::rgbank::monolithic {
  include profile::common
  include profile::apache
  include profile::mysql::client
  include profile::mysql::server
  #  include profile::rgbank::db
  # include profile::rgbank::web

  class { 'profile::rgbank::db':
    user     => 'demo',
    password => 'demo',
  }

  class { 'profile::rgbank::web':
    db_name     => 'rgbank-db',
    db_host     => 'localhost',
    db_user     => 'demo',
    db_password => 'demo',
  }

  Class['profile::mysql::server'] -> Class['profile::rgbank::db']
  Class['profile::apache'] -> Class['profile::rgbank::web']
  Class['profile::rgbank::db'] -> Class['profile::rgbank::web']
}

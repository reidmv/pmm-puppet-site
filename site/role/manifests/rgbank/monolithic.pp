class role::rgbank::monolithic {
  include profile::common
  include profile::apache
  include profile::mysql::client
  include profile::mysql::server
  include profile::rgbank::db
  include profile::rgbank::web

  Class['profile::mysql::server'] -> Class['profile::rgbank::db']
  Class['profile::apache'] -> Class['profile::rgbank::web']
}

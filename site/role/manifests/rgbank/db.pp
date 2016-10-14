class role::rgbank::db {
  include profile::common
  include profile::mysql::server
  include profile::rgbank::db

  Class['profile::mysql::server'] -> Class['profile::rgbank::db']
}

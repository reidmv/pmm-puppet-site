class role::rgbank::web {
  include profile::common
  include profile::apache
  include profile::mysql::client
  include profile::rgbank::web
}

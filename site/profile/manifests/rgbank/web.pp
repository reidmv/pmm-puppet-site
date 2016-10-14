class profile::rgbank::web (
  $use_docker = false,
  $db_name,
  $db_host,
  $db_user,
  $db_password,
) {
  include profile::common
  include profile::apache::remove
  include profile::nginx
  include profile::mysql::client
  include profile::git

  Class['profile::common'] -> Class['profile::nginx']
  Class['profile::apache::remove'] -> Class['profile::nginx']

  rgbank::web { "web-app":
    db_name     => $db_name,
    db_host     => $db_host,
    db_user     => $db_user,
    db_password => $db_password,
    use_docker  => $use_docker,
  }
}

class profile::apache(
  $default_vhost = false
) {
  class { 'apache':
    default_vhost => $default_vhost,
  }
  if $::osfamily == 'Debian' {
    class { 'apache::mod::php':
      php_version => '7',
    }
  }
  else {
    class { 'apache::mod::php': }
  }
}

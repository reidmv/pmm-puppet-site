class profile::nginx {
  if $::operatingsystem == "RedHat" {
    include profile::remi
  }

  class { 'php': 
    composer => false,
  }
  class { 'nginx': }

  Class['php'] -> Class['nginx']
}

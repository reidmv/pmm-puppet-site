#
# This profile is intended to set a common platform for all nodes in the
# environment. As soon as there is a "one-off" node that needs to not have some
# configuration that's defined in here, then that configuration isn't common
# and shouldn't be here.
#
class profile::common {
  include profile::pe_env
  include profile::firewall

  if $::ec2_metadata {
    include profile::ec2_user
  }

  case $::osfamily {
    default: { } # for OS's not listed, do nothing
    'RedHat': {
      include epel
    }
    'Debian': {
      include apt
      apt::conf { 'unauth':
        priority  => 99,
        content => 'APT::Get::AllowUnauthenticated 1;'
      }
    }
  }

  if $::kernel == 'Linux' {
    service { 'NetworkManager':
      ensure => stopped,
      enable => false,
    }

    package { 'wget':
      ensure => installed,
    }
  }

}

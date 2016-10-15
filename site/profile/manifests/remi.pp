class profile::remi {
  yumrepo { 'remi':
    enabled    => 1,
    mirrorlist => 'http://rpms.remirepo.net/enterprise/7/remi/mirror',
    descr      => 'Remi\'s RPM repository for Enterprise Linux 7 - $basearch',
    gpgcheck   => 1,
    gpgkey     => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi',
  }
}

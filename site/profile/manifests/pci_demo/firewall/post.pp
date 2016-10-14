class profile::pci_demo::firewall::post {

  ## For a default deny configuration, the following rule might be declared
  ## here.
  #
  # firewall { '999 drop all':
  #   proto   => 'all',
  #   action  => 'drop',
  #   before  => undef,
  # }

}

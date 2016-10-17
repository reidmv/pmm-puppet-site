class profile::pci_demo::mysql_base_install (

  #############################
  ##PCI Example: Protect Data##
  #############################

  Sensitive[String] $m_r_p = Sensitive(hiera($mysql_root_password)),
){
  class { '::mysql::server':
    create_root_user        => true,
    root_password           => $m_r_p,
    remove_default_accounts => true,
  }

}

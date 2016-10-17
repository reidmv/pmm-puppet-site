class profile::pci_demo::mysql_base_install (

  #############################
  ##PCI Example: Protect Data##
  #############################

  Sensitive[String] $mysql_root_password,
){
  class { '::mysql::server':
    create_root_user        => true,
    root_password           => Sensitive(hiera($mysql_root_password)),
    remove_default_accounts => true,
  }

}

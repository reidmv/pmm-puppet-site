class profile::pci_demo::mysql_base_install (

  #############################
  ##PCI Example: Protect Data##
  #############################

  ###Value automatically retrieved from heira eyaml (encrypted yaml) backend
  $mysql_root_password

){
  class { '::mysql::server':
    create_root_user        => true,
    root_password           => $mysql_root_password,
    remove_default_accounts => true,
  }

}

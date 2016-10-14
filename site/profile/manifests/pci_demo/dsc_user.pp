class profile::pci_demo::dsc_user {


  #DSC declaration of user resource

  dsc_user { 'User account for Shane': 
    dsc_ensure                   => 'present',
    dsc_username                 => 'spencer_dsc',
    dsc_description              => 'user account for Spencer with DSC',
    dsc_passwordchangerequired   => 'true',
    dsc_passwordneverexpires     => 'false',
    dsc_passwordchangenotallowed => 'false',
    dsc_disabled                 => 'false',
    dsc_fullname                 => 'Shane Sorbello',
    # dsc_password                 => 'pupp3tl@bs',  -- DSC requires password hashes, doesn't allow cleartext like puppet
  } 

  dsc_group { 'Administrators group':
    dsc_ensure      => 'present',
    dsc_groupname   => 'Administrators',
    dsc_description => 'Builtin Administrators Group',
    dsc_memberstoinclude     => ['shane_puppet','shane_dsc','vagrant'],
  }

  #User and group declaration using Puppet

  user { 'shane_puppet':
    ensure   => present,
    comment  => 'user account for Shane with Puppet',
    password => 'pupp3tl@bs',
    groups   => ['BUILTIN\Administrators'], # With Puppet you can manage the user's group membership, in DSC this has to be done through the Group declaration
  }

  #In order to get the user resource in puppet on par with DSC, we have to incorporate some powershell w/ an exec 

  #get-wmiobject -class win32_account

  group { 'Administrators': 
    ensure  => present,
    members => ['shane_puppet','vagrant','shane_dsc'],
  }


}

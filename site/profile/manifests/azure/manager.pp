class profile::azure::manager (
  $subscription_id = 'something',
  $cert_path = 'something',
  $client_id = 'something',
  $client_secret = 'something',
  $tenant_id = 'something',
){
  include nodejs
  ensure_packages(['gcc-c++', 'libxslt-devel', 'libxml2-devel',])
  $gem_packages = ['retries', 'azure', 'azure_mgmt_compute', 'azure_mgmt_storage', 'azure_mgmt_resources', 'azure_mgmt_network', 'hocon']
  package { 'azure-cli':
    ensure   => present,
    provider => npm,
  }

$gem_packages.each |String $gem| {
  package {"puppet gem install for ${gem}":
    ensure   => present,
    name     => $gem,
    provider => puppet_gem,
  }
  if $::pe_server_version {
    package {"puppetserver gem install for ${gem}":
      ensure   => present,
      name     => $gem,
      provider => puppetserver_gem,
      notify   => Service['pe-puppetserver'],
    }
  }
}
  file { '/etc/puppetlabs/puppet/azure.conf':
    ensure  => present,
    content => "azure: {
  subscription_id: \"${subscription_id}\"
  management_certificate: \"${cert_path}\"
  tenant_id: \"${tenant_id}\"
  client_id: \"${client_id}\"
  client_secret: \"${client_secret}\"
}"
  }
}

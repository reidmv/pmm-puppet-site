class profile::cloud::azure::manager {
  include nodejs
  ensure_packages(['gcc-c++', 'libxslt-devel', 'libxml2-devel',])
  $gem_packages = ['retries', 'azure', 'azure_mgmt_compute', 'azure_mgmt_storage', 'azure_mgmt_resources', 'azure_mgmt_network', 'hocon']
  package { 'azure-cli':
    ensure   => present,
    provider => npm,
  }

  package {$gem_packages:
    ensure   => present,
    provider => puppet_gem,
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

define profile::cloud::azure::linux (
  $server_name = $name,
  $port        = '80',
  $master_ip   = '52.39.72.238',
  $master_host = 'ip-172-31-6-59.us-west-2.compute.internal',
  $agent_role  = 'baseline',
  $deployment  = '1683',
  $application = 'rgbank',
  $cluster     = 'default',
){
  azure_vm_classic { $server_name:
    ensure          => 'running',
    endpoints       => [{
      name        => 'ssh',
      local_port  => 22,
      public_port => 22,
      protocol    => 'TCP',
    },
    {
      name        => 'app',
      local_port  => $port,
      public_port => $port,
      protocol    => 'TCP',
    }],
    image           => 'b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu-16_04-LTS-amd64-server-20160627-en-us-30GB',
    user            => 'azure',
    password        => 'Puppetl@bs!',
    location        => 'South Central US',
    size            => 'Basic_A3',
    cloud_service   => "${name}${deployment}",
    deployment      => "${name}${deployment}",
    storage_account => "${name}${deployment}",
    subnet          => 'default',
    virtual_network => 'Group puppetconf_demo puppetconf_demo',
    custom_data     => template('profile/bootstrap_agent.sh.erb'),
  }
}

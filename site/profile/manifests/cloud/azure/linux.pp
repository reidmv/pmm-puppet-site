define profile::cloud::azure::linux (
  $server_name = $name,
  $port        = '80',
  $master_ip   = '40.122.40.252',
  $master_host = 'master-jamesjones-puppetconf.nwg5gle4glnunglfn3lvntwiqh.gx.internal.cloudapp.net',
  $agent_role  = 'baseline',
  $deployment  = '1681',
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
    image                       => 'b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu-16_04-LTS-amd64-server-20160627-en-us-30GB',
    user                        => 'azure',
    password                    => 'Puppetl@bs!',
    location                    => 'South Central US',
    size                        => 'Basic_A3',
    cloud_service               => "${name}${deployment}",
    deployment                  => "${name}${deployment}",
    storage_account             => "${name}${deployment}",
    custom_data                 => template('profile/bootstrap_agent.sh.erb'),
  }
}

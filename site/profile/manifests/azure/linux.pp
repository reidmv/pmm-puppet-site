define profile::cloud::azure::linux (
  $server_name = $title,
  $port        = '80',
  $master_ip   = '104.215.94.2',
  $master_host = 'puppetmaster3102.cloudapp.net',
){
  azure_vm_classic { $server_name:
    ensure          => 'running',
    endpoints       => [
      {
        'direct_server_return' => 'false',
        'local_port'           => "${port}",
        'name'                 => 'app',
        'protocol'             => 'tcp',
        'public_port'          => "${port}"
      },
      {
        'direct_server_return' => 'false',
        'local_port'           => '22',
        'name'                 => 'SSH',
        'protocol'             => 'tcp',
        'public_port'          => '22'
      }
    ],
    image           => 'b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu-16_04-LTS-amd64-server-20160627-en-us-30GB',
    user            => 'azure',
    cloud_service   => "${name}1677",
    deployment      => "${name}1677",
    storage_account => "${name}1677",
    password        => 'PuppetL@bs!1234',
    location        => 'South Central US',
    size            => 'Standard_DS1_v2',
    subnet          => 'default',
    virtual_network => 'Group puppet_demo puppet_demo',
    custom_data     => template('profile/bootstrap_agent.sh.erb'),
  }
}

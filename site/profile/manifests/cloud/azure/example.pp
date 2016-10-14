class profile::cloud::azure::example (
  $deployment = '1685',
  $cluster    = $deployment,
)
{

  profile::cloud::azure::linux { 'monolithic':
    port       => '8060',
    agent_role => 'rgbank_monolithic',
    deployment => $deployment,
    cluster    => "${cluster}-monolithic",
  }

  profile::cloud::azure::linux { 'webserver':
    port       => '8060',
    agent_role => 'webserver',
    deployment => $deployment,
    cluster    => $cluster,
  }
  
  profile::cloud::azure::linux { 'dbserver':
    port       => '3306',
    agent_role => 'DatabaseNode',
    deployment => $deployment,
    cluster    => $cluster,
  }

}


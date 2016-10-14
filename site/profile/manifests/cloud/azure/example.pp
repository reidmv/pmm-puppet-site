class profile::cloud::azure::example (
  $deployment = '1684',
  $cluster    = '1684',
)
{

  profile::cloud::azure::linux { 'monolithic':
    port       => '8060',
    agent_role => 'rgbank_monolithic',
    deployment => $deployment,
    cluster    => $cluster,
  }

  #  profile::cloud::azure::linux { 'webserver':
  #  port       => '8060',
  #  agent_role => 'webserver',
  #  deployment => $deployment,
  #}
}

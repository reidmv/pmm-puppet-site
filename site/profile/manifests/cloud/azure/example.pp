class profile::cloud::azure::example {

  profile::cloud::azure::linux { 'dbserver':
    port       => '3306',
    agent_role => 'databaseserver',
  }

  #  profile::cloud::azure::linux { 'webserver':
  #  port       => '80',
  #  agent_role => 'generic_website',
  #}
}


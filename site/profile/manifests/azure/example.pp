class profile::cloud::azure::example {
  profile::cloud::azure::linux { 'dbserver':
    port => '3306',
  }
}

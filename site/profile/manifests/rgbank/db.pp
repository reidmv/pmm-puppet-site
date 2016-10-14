class profile::rgbank::db (
  $user,
  $password,
  $port,
) {
  rgbank::db { "rgbank-db":
    user     => $user,
    password => $password,
  }
}

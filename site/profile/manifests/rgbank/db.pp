class profile::rgbank::db (
  $user,
  $password,
  $name = 'rgbank-db',
) {
  rgbank::db { "rgbank-db":
    user     => $user,
    password => $password,
  }
}

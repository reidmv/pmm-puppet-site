class profile::rgbank::db (
  $user,
  $password,
  $dbname = 'rgbank-db',
) {
  rgbank::db { "rgbank-db":
    user     => $user,
    password => $password,
  }
}

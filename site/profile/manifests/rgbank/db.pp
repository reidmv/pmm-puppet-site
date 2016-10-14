class profile::rgbank::db (
  $user,
  $password,
) {
  rgbank::db { "rgbank-db":
    user     => $user,
    password => $password,
  }
}

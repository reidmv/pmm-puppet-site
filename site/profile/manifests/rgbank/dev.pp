class profile::rgbank::dev (
  $source = undef,
  $revision = undef,
) {

  Vcsrepo <| tag == 'rgbank::web' |> {
    source   => $source,
    revision => $revision,
    force    => true,
  }

}

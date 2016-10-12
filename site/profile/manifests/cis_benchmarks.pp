class profile::cis_benchmarks {
  if $::environment == 'cis_benchmarks' {
    include cis_rhel7
  }
}

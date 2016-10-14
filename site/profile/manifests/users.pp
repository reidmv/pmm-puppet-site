class profile::users {
  ssh_authorized_key { 'james.jones@puppet.com':
    user  => 'ec2-user',
    type  => 'ssh-rsa',
    key   => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQC5mHT+7JTGIq2PzFauCMMMr/bB2u/KCRPUYAGpHpcme8XBHi6Gy9FO5qzj6LsPquQV7hAM73c05zlZHnnBx/6uoqkKZeiJIIIVlBHlM8De7G0P8Elt/mHQW5I+KZHvLPTQJVNa7RjzxBdbzLMDLzhSxuTtsJeTJrjmCEw6YMDnW7jHs4XkA4f2pn4qqU0fEC+5sMhxmj26Ea0z3bE4SWnrJxqbvcl4xVL3LWuvd4IUGRbbix+ljqNBBjY51WahEjtbsvMrM42tO4bLPlV1NCuI6JvSmltABMoC/8sno323/zjYrsaCkfYXunWScOsR9hM6/mZygCktZHmduQ19uj25',
  }

  ssh_authorized_key { 'reid.2014-04-17@puppetlabs.com':
    user  => 'ec2-user',
    type  => 'ssh-rsa',
    key   => 'AAAAB3NzaC1yc2EAAAADAQABAAACAQDMlV83Evx6LhGFJ+hWKekION/ANE0E1gbNSWaonT5dqGjzR/AzUraacr5VT7duvQ25fhOTvn7z/xbIsIFRn0pTN45L1v7sRuErcM3jD8KCoUtyon85+gZlqnapKFbqx2ESAIt9cCqGabr3ITUB9Z10mjzfI1r/NX8C/o/8NwXSIkytpA2OVh8jikaDg2sfLmD7Tt0CVUO3+QWVajY7nrIq42umNSEMWcy8wnLyz1l+WyCcTa6s56ouYtF4U5luRHRQuD3TNeBMu+mipocXFZ8ldcpFs5tOYTxTZv/riX81XaODRysW9JTO59pwJ4zImM+RxgWa9zLIzwAqd852j9PmZnh72y5oIXAq4HYzBN7NIjCRdQntlGWATBhN2c2h+UqevKTF8D3CRFxI5nCuoIE5FeHGySnueez07iCK3MiSjGmU9pbj2vu7DoJGnIyVHzY/rGsPVLHKMyHmPwaKyGXlK4kcksval2u5ayTXeLJfD5Z/w2lhz3Y/os+jBzdo3gr7J3OpyjC4f3HKandX4TE/MGsabz6IxL0VVL0yuztAH5MOi044VCOSNmXleAtB0Ls2HwaYSV3WlNyA+Ro9p01dbARTfkC6mUXftpzxfwbcFKwhW8UMhgFM1b0yKeCbMF1s5qaQBscRXNz7zKHLBe/fXBvuFm87D8m1Th+8Jmm29Q==',
  }
}

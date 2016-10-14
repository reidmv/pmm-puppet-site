class profile::stig_baseline {

$compliance_profile = 'stig'

include ::auditd
#include ::iptables
#include ::ssh
#include ::pki
include ::sudo

}

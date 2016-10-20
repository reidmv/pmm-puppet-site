class profile::iis::baseline (
  $root_iis_path  = hiera('profile::iis::baseline::root_iis_path','C:/inetpub'),
) {

  $dotnet_cloudshop_server = [ 'NET-Framework-45-Core', 'NET-Framework-45-ASPNET', 'AS-NET-Framework']

  $iis_cloudshop_server =  ['Web-Server',
                            'Application-Server',
                            'AS-Web-Support',
                            'Web-Mgmt-Tools',
                            'Web-Mgmt-Console',
                            'Web-Scripting-Tools',
                            'Web-WebServer',
                            'Web-App-Dev',
                            'Web-Asp-Net45',
                            'Web-ISAPI-Ext',
                            'Web-ISAPI-Filter',
                            'Web-Net-Ext45',
                            'Web-Common-Http',
                            'Web-Default-Doc',
                            'Web-Dir-Browsing',
                            'Web-Http-Errors',
                            'Web-Http-Redirect',
                            'Web-Static-Content',
                            'Web-Health',
                            'Web-Http-Logging',
                            'Web-Log-Libraries',
                            'Web-Request-Monitor',
                            'Web-Stat-Compression',
                            'Web-Dyn-Compression',
                            'Web-Security',
                            'Web-Basic-Auth',
                            'Web-Digest-Auth',
                            'Web-Filtering',
                            'Web-IP-Security',
                            'Web-Url-Auth',
                            'Web-Windows-Auth']

  # Install Dot Net 4.5 first
  windowsfeature { $dotnet_cloudshop_server:
    ensure => present,
  } ->

  # Install IIS and dependent features
  windowsfeature { $iis_cloudshop_server:
    ensure => present,
  } ->
  # Stop the Default Website
  dsc_xwebsite { 'DefaultSite':
    dsc_ensure => 'Present',
    dsc_name   => "Default Web Site",
    dsc_state  => "Stopped",
  }

  file { $root_iis_path:
    ensure => 'directory',
  }
  
}
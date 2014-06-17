# == Class: scl::ruby193
#
# === Authors
#
# Trey Dockendorf <treydock@gmail.com>
#
# === Copyright
#
# Copyright 2013 Trey Dockendorf
#
class scl::ruby193 (
  $repo_name            = 'UNSET',
  $repo_descr           = 'UNSET',
  $repo_baseurl         = 'UNSET',
  $repo_failovermethod  = 'UNSET',
  $repo_enabled         = 'UNSET',
  $repo_gpgcheck        = 'UNSET',
  $enable_default       = '',
) inherits scl::params {

  scl::collection { 'ruby193':
    repo_name           => $repo_name,
    repo_descr          => $repo_descr,
    repo_baseurl        => $repo_baseurl,
    repo_failovermethod => $repo_failovermethod,
    repo_enabled        => $repo_enabled,
    repo_gpgcheck       => $repo_gpgcheck,
  }

  # If the user want ruby193 to be de defaullt ruby on the system
  if $enable_default == '1' {
    
    # Get the package
    package { 'ruby193':
      ensure   => 'present',
    }

    # Tell the shell to use the ruby
    file { '/etc/profile.d/scl-ruby193-enable.sh':
      ensure  => 'file',
      content  => template('scl/scl-ruby193-enable.sh.erb'),
    }
  }

}
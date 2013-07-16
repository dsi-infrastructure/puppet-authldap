# class authldap
#
class authldap($nss_admin,$nss_password,$base_dn,$base_host) {

  $packages = ['libpam-ldapd','libnss-ldapd','nscd','nslcd']

  package { $packages:
    ensure => installed,
  }

  file { '/etc/pam.d/common-session':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/authldap/common-session',
    require => Package['libpam-ldapd'],
  }

  file { '/etc/nsswitch.conf':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/authldap/nsswitch.conf',
    require => Package['libnss-ldapd'],
  }

  file { '/etc/nslcd.conf':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    content => template('authldap/nslcd.conf.erb'),
    require => Package['nslcd'],
    notify  => Service['nslcd'],
  }

  service{'nslcd':
    ensure  => running,
    enable  => true,
    require => Package['nslcd'],
  }

  service{'nscd':
    ensure  => running,
    enable  => true,
    require => Package['nscd'],
  }
}


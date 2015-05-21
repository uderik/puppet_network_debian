class network_debian {
  if ( $facts['lsbmajdistrelease'] == 8 ) {
    #notice("Welcome to LXC Debian 8.0 installer")
  } else {
    fail("This network configuration for Debian 8.0")
  }

  package { 'ifupdown':
      ensure  => installed,
      before  => Exec['lxc-debian'],
  }

  package { 'isc-dhcp-client':
      ensure => installed,
  }
  package { 'bridge-utils':
      ensure => installed,
  }

  service { 'networking':
      ensure  => 'running',
      enable  => 'true',
      require => Package["ifupdown"],
  }

  # check dir
  $iface_conf_dir='/etc/network/interfaces.d'

  file {"$iface_conf_dir":
      ensure => "directory",
      owner  => root,
      group  => root,
      mode   => 755,
  }

  exec { 'network-debian':
      command     => 'echo "postfix packages are installed"',
      path        => '/usr/sbin:/bin:/usr/bin:/sbin',
      logoutput   => true,
      refreshonly => true,
  }



  file {"/etc/network/interfaces":
      ensure  => "present",
      owner   => root,
      group   => root,
      mode    => 644,
      content => template('network_debian/interfaces.rb'),
      notify  => Service['networking'],
  }

  $interfaces = $facts['interfaces']
  $_hash=hiera_hash('network-interfaces', undef)
  $iface = keys($_hash)
  iface_params {
  $iface:
    hash =>  $_hash;
  }
}

define iface_params ($hash){
  $iface_type         = $hash[$name]['type']
  $iface_method       = $hash[$name]['method']
  $iface_hwaddr       = $hash[$name]['hwaddr']
  $iface_addr         = $hash[$name]['ipaddress']
  $iface_netmask      = $hash[$name]['netmask']
  $iface_br_ports     = $hash[$name]['bridge_ports']
  $iface_br_fd        = $hash[$name]['bridge_fd']
  $iface_br_maxwait   = $hash[$name]['bridge_maxwait']
  $iface_gateway      = $hash[$name]['gateway']
  $iface_dns          = $hash[$name]['dns-nameservers']
  $iface_dns_search   = $hash[$name]['dns-search']
  $iface_name         = $name
  $iface_conf_dir     = '/etc/network/interfaces.d'

  file {"$iface_conf_dir/$iface_name":
      ensure    => "present",
      owner     => root,
      group     => root,
      mode      => 644,
      content   => template('network_debian/iface.rb'),
  }

  exec { "$iface_name-clear":
    path        => ["/usr/bin", "/sbin","/bin","/usr/sbin"],
    command     => "ip addr flush dev $iface_name",
    subscribe   => File["$ifddace_conf_dir/$iface_name"],
    onlyif      => "ifconfig $iface_name",
    notify      => Service['networking'],
    logoutput   => true,
    refreshonly => true
  }
}


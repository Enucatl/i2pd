class i2pd::daemon::base (
  String $config_file,
  String $user,
  String $group,
  Optional[String] $tunconf = undef,
  Optional[String] $tunnelsdir = undef,
  Optional[String] $certsdir = undef,
  Optional[String] $pidfile = undef,
  Optional[String] $log = undef,
  Optional[String] $logfile = undef,
  Optional[String] $loglevel_ = undef,
  Optional[String] $logclftime = undef,
  Optional[String] $daemon_mode = undef,
  Optional[String] $family = undef,
  Optional[String] $ifname = undef,
  Optional[String] $ifname4 = undef,
  Optional[String] $ifname6 = undef,
  Optional[String] $address4 = undef,
  Optional[String] $address6 = undef,
  Optional[String] $host = undef,
  ## By default i2pd picks random port. You MUST pick a random number too
  Optional[Integer]$port = undef,  
  Optional[Boolean] $ipv4 = undef,
  Optional[Boolean] $ipv6 = undef,
  Optional[Boolean] $ssu = undef,
  Optional[String] $bandwidth = undef,
  Optional[Integer] $share = undef,
  Optional[Boolean] $notransit = undef,
  Optional[Boolean] $floodfill = undef,
) {

  group { $group:
    ensure    => present,
    allowdupe => false,
  }

  user { $user:
    ensure    => present,
    allowdupe => false,
    comment   => 'i2pd user,,,',
    shell     => '/bin/false',
    gid       => $group,
    require   => Group[$group],
  }

  file { '/etc/i2pd': 
    ensure  => directory,
    mode    => '0755',
    owner   => 'root',
    group   => 'root',
    require => Package['i2pd'],
  }

  concat { $config_file:
    mode    => '0640',
    owner   => 'root',
    group   => $group,
    require => Package['i2pd'],
    notify  => Service['i2pd'],
  }

  concat::fragment { '00.header':
    content => stdlib::deferrable_epp('i2pd/i2pd.conf/00_header.epp', {}),
    order   => '00',
    target  => $config_file,
  }

  concat::fragment { '01.global':
    content => stdlib::deferrable_epp('i2pd/i2pd.conf/01_global.epp', {
      'tunconf'     => $tunconf,
      'tunnelsdir'  => $tunnelsdir,
      'certsdir'    => $certsdir,
      'pidfile'     => $pidfile,
      'log'         => $log,
      'logfile'     => $logfile,
      'loglevel_'   => $loglevel_,
      'logclftime'  => $logclftime,
      'daemon_mode' => $daemon_mode,
      'family'      => $family,
      'ifname'      => $ifname,
      'ifname4'     => $ifname4,
      'ifname6'     => $ifname6,
      'address4'    => $address4,
      'address6'    => $address6,
      'host'        => $host,
      'port'        => $port,
      'ipv4'        => $ipv4,
      'ipv6'        => $ipv6,
      'ssu'         => $ssu,
      'bandwidth'   => $bandwidth,
      'share'       => $share,
      'notransit'   => $notransit,
      'floodfill'   => $floodfill,
      }),
    order   => '01',
    target  => $config_file,
  }

}

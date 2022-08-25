class i2pd::daemon::base (
  String $config_file,
  String $user,
  String $group,
  Optional[Hash] $config = {},
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

  concat::fragment { 'i2pd.00.header':
    content => stdlib::deferrable_epp('i2pd/i2pd.conf/00_header.epp', {}),
    order   => '00',
    target  => $config_file,
  }

  concat::fragment { 'i2pd.01.config':
    content => stdlib::deferrable_epp('i2pd/i2pd.conf/01_config.epp', {
      'config'     => $config,
      }),
    order   => '01',
    target  => $config_file,
  }

}

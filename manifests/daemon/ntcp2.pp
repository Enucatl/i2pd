class i2pd::daemon::ntcp2 (
  Optional[Boolean] $enabled = undef,
  Optional[Boolean] $published = undef,
  Optional[Integer] $port = undef,
) {
  concat::fragment { '02.ntcp2':
    content => stdlib::deferrable_epp('i2pd/i2pd.conf/02_ntcp2.epp', {
      'enabled'   => $enabled,
      'published' => $published,
      'port'      => $port, 
      }),
    order   => '02',
    target  => $i2pd::daemon::base::config_file,
  }
}

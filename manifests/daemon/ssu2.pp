class i2pd::daemon::ssu2 (
  Optional[Boolean] $enabled = undef,
  Optional[Boolean] $published = undef,
  Optional[Integer] $port = undef,
) {
  concat::fragment { '03.ssu2':
    content => stdlib::deferrable_epp('i2pd/i2pd.conf/03_ssu2.epp', {
      'enabled'   => $enabled,
      'published' => $published,
      'port'      => $port, 
      }),
    order   => '03',
    target  => $i2pd::daemon::base::config_file,
  }
}

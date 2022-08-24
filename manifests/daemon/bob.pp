class i2pd::daemon::bob (
  Optional[String] $address = undef,
  Optional[Integer] $port = undef,
  Optional[Boolean] $enabled = undef,
) {
  concat::fragment { '08.bob':
    content => stdlib::deferrable_epp('i2pd/i2pd.conf/08_bob.epp', {
      'enabled'       => $enabled,
      'address'       => $address,
      'port'          => $port,
      }),
    order   => '08',
    target  => $i2pd::daemon::base::config_file,
  }
}

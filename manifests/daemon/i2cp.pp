class i2pd::daemon::i2cp (
  Optional[String] $address = undef,
  Optional[Integer] $port = undef,
  Optional[Boolean] $enabled = undef,
) {
  concat::fragment { '09.i2cp':
    content => stdlib::deferrable_epp('i2pd/i2pd.conf/09_i2cp.epp', {
      'enabled'       => $enabled,
      'address'       => $address,
      'port'          => $port,
      }),
    order   => '09',
    target  => $i2pd::daemon::base::config_file,
  }
}

class i2pd::daemon::sam (
  Optional[String] $address = undef,
  Optional[Integer] $port = undef,
  Optional[Boolean] $enabled = undef,
) {
  concat::fragment { '06.sam':
    content => stdlib::deferrable_epp('i2pd/i2pd.conf/06_sam.epp', {
      'enabled'       => $enabled,
      'address'       => $address,
      'port'          => $port,
      }),
    order   => '06',
    target  => $i2pd::daemon::base::config_file,
  }
}

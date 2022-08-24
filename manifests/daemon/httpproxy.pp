class i2pd::daemon::httpproxy (
  String $address,
  Integer $port,
  Optional[Boolean] $enabled = undef,
  Optional[String] $keys = undef,
  Optional[Boolean] $addresshelper = undef,
  Optional[String] $outproxy = undef,
) {
  concat::fragment { '05.httpproxy':
    content => stdlib::deferrable_epp('i2pd/i2pd.conf/05_httpproxy.epp', {
      'enabled'       => $enabled,
      'address'       => $address,
      'port'          => $port,
      'keys'          => $keys, 
      'addresshelper' => $addresshelper, 
      'outproxy'      => $outproxy, 
      }),
    order   => '05',
    target  => $i2pd::daemon::base::config_file,
  }
}

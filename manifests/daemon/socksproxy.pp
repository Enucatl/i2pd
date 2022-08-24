class i2pd::daemon::socksproxy (
  String $address,
  Integer $port,
  Optional[Boolean] $enabled = undef,
  Optional[String] $keys = undef,
  Optional[Boolean] $outproxy_enabled = undef,
  Optional[String] $outproxy = undef,
  Optional[Integer] $outproxyport = undef,
) {
  concat::fragment { '07.socksproxy':
    content => stdlib::deferrable_epp('i2pd/i2pd.conf/07_socksproxy.epp', {
      'enabled'          => $enabled,
      'address'          => $address,
      'port'             => $port,
      'keys'             => $keys, 
      'outproxy_enabled' => $outproxy_enabled, 
      'outproxy'         => $outproxy, 
      'outproxyport'     => $outproxyport,
      }),
    order   => '07',
    target  => $i2pd::daemon::base::config_file,
  }
}

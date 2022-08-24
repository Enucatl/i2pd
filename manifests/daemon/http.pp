class i2pd::daemon::http (
  String $address,
  Integer $port,
  Optional[Boolean] $enabled = undef,
  Optional[String] $webroot = undef,
  Optional[Boolean] $auth = undef,
  Optional[String] $user = undef,
  Optional[String] $pass = undef,
  Optional[String] $lang = undef,
) {
  concat::fragment { '04.http':
    content => stdlib::deferrable_epp('i2pd/i2pd.conf/04_http.epp', {
      'enabled' => $enabled,
      'address' => $address,
      'port'    => $port,
      'webroot' => $webroot, 
      'auth'    => $auth, 
      'user'    => $user, 
      'pass'    => $pass, 
      'lang'    => $lang,
      }),
    order   => '04',
    target  => $i2pd::daemon::base::config_file,
  }
}

class i2pd (

) {
  include ::i2pd::install
  include ::i2pd::daemon::base

  service { 'i2pd':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    provider   => 'systemd',
    require    => Package['i2pd'],
  }

}

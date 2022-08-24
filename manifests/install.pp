# @summary Manages package installation.
#
class i2pd::install (String $version) {

  $os_name = downcase($facts['os']['name'])
  if $facts['os']['family'] == 'Debian' {
    ensure_packages('apt-transport-https')

    apt::source {
      'i2pd':
        comment  => 'i2pd',
        location => "https://repo.i2pd.xyz/${os_name} ${facts['os']['codename']}",
        key      => {
          id     => "951928BB317024EFD053D73C66F6C87B98EBCFE2",
          source => "https://repo.i2pd.xyz/r4sas.gpg",
        },
        include  => {
          'src' => true,
          'deb' => true,
        },
        require  => [ Package['apt-transport-https'] ],
        before   => Package['i2pd'],
    }


    apt::pin {
      'i2pd':
        packages   => [ 'i2pd' ],
        priority   => 1000,
        originator => 'i2pd',
        component  => 'main';

      'i2pd-negative':
        packages   => '*',
        priority   => 200,
        originator => 'i2pd',
        component  => 'main';
    }

  }

  elsif $facts['os']['family'] != 'Debian' {
    alert("Unsupported managed repository for osfamily: ${::osfamily}, operatingsystem: ${::operatingsystem}, module ${module_name} currently only supports upstream repository for osfamily Debian") # lint:ignore:80chars
  }

  package { 'i2pd':
    ensure  => $version,
  }

}

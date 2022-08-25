# i2pd

## Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with i2pd](#setup)
    * [What i2pd affects](#what-i2pd-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with i2pd](#beginning-with-i2pd)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Development - Guide for contributing to the module](#development)

## Description

Install, configure and run an i2pd daemon.

## Setup

### What i2pd affects

The official repository from [repo.i2pd.xyz](https://repo.i2pd.xyz) will be
added to apt sources on Debian family.

### Setup Requirements

If not on Debian, you'll have to add the repository on your own.

### Beginning with i2pd

## Usage

Easiest with Hiera, create a hash with your i2pd.conf. Section titles are
keys, values are an inner hash of actual key-value pairs inside each
section.

The opening "global" section of the i2pd.conf file is in the special key
`global`, but that's not output to the file.

```yaml
classes:
  - i2pd

i2pd::install::version: 'latest'
i2pd::daemon::base::user: 'i2pd'
i2pd::daemon::base::group: 'i2pd'
i2pd::daemon::base::config_file: '/etc/i2pd/i2pd.conf'
i2pd::daemon::base::config:
  global:
    log: 'file'
    ipv4: true
    ipv6: false
  http:
    address: '127.0.0.1'
    port: 7070
  httpproxy:
    address: '127.0.0.1'
    port: 4444
  socksproxy:
    address: '127.0.0.1'
    port: 4447
  sam:
    enabled: true
  reseed:
    verify: true
```

Will result in a `/etc/i2pd/i2pd.conf` file below. See the [i2pd
docs](https://i2pd.readthedocs.io/en/latest/user-guide/configuration/) for more options.
```
## File managed by Puppet

## See https://i2pd.readthedocs.io/en/latest/user-guide/configuration/
## for more options you can use in this file.


log = file
ipv4 = true
ipv6 = false

[http]
address = 127.0.0.1
port = 7070

[httpproxy]
address = 127.0.0.1
port = 4444

[socksproxy]
address = 127.0.0.1
port = 4447

[sam]
enabled = true

[reseed]
verify = true
```

## Development
Send me a pull request on github if you want to contribute.

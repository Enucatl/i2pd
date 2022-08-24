node default {
  include i2pd
  include i2pd::daemon::ntcp2
  include i2pd::daemon::ssu2
  include i2pd::daemon::http
  include i2pd::daemon::httpproxy
  include i2pd::daemon::sam
  include i2pd::daemon::socksproxy
  include i2pd::daemon::bob
  include i2pd::daemon::i2cp
}

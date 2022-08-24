node default {
  include i2pd
  include i2pd::daemon::ntcp2
  include i2pd::daemon::ssu2
  include i2pd::daemon::http
  include i2pd::daemon::httpproxy
}

file { '/etc/motd':
  ensure  => file,
  owner   => 'root',
  group   => 'root',
  mode    => '0644',
  content => "Hey, Puppet is groovy\n",
}

package { 'cowsay':
  ensure   => present,
  provider => gem,
}

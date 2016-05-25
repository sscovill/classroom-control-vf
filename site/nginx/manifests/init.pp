class nginx {

package { 'nginx':
ensure => present,
before => File['/etc/nginx/nginx.conf'],
}

File {
  owner => 'root',
  group => 'root',
}

file { '/var/www':
ensure => directory,
mode => '0775',
}

file { '/var/www/index.html':
ensure => file,
mode => '0664',
source => 'puppet:///modules/nginx/index.html',
}

file { '/etc/nginx/nginx.conf':
ensure => file,
mode => '0664',
source => 'puppet:///modules/nginx/nginx.conf',
require => Package['nginx'],
notify => Service['nginx'],
}

file { '/etc/nginx/conf.d':
ensure => directory,
mode => '0775',
}

file { '/etc/nginx/conf.d/default.conf':
ensure => file,
mode => '0664',
source => 'puppet:///modules/nginx/default.conf',
require => Package['nginx'],
notify => Service['nginx'],
}

service { 'nginx':
ensure => running,
enable => true,
}

}
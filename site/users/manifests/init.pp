class users {
  user { 'fundamentals':
  ensure => present,
 }
 user { 'shawn':
  ensure => present,
 }
 user { 'Vertex':
  ensure => present,
 }
}


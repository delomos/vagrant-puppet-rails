$home = '/home/vagrant'

Exec {
  path => ['/usr/sbin', '/usr/bin', '/sbin', '/bin']
}

exec { "apt-update":
  command => "/usr/bin/apt-get update"
}

Exec["apt-update"] -> Package <| |>

# -

include apt
include rvm

File { owner => 0, group => 0, mode => 0644 }

file { '/etc/motd':
  content => "Welcome to your Dev Box!"
}

stage { 'preinstall':
  before => Stage['main']
}

# ExecJS runtime.
package { 'nodejs':
  ensure => installed
} ->

rvm_system_ruby {
  'ruby-1.9.3':
    ensure => 'present',
    default_use => true;
} ->

rvm::system_user { vagrant: ; } ->

class {
  'rvm::passenger::apache':
    version => '3.0.11',
    ruby_version => 'ruby-1.9.3',
    mininstances => '3',
    maxinstancesperapp => '0',
    maxpoolsize => '30',
    spawnmethod => 'smart-lv2';
} ->

rvm_gem {
  'bundler':
    name => 'bundler',
    ruby_version => 'ruby-1.9.3',
    ensure => latest,
    require => Rvm_system_ruby['ruby-1.9.3'];

    'capistrano':
    name => 'capistrano',
    ruby_version => 'ruby-1.9.3',
    ensure => latest,
    require => Rvm_system_ruby['ruby-1.9.3'];
} ->

class { 'mysql':
  bind_address => '0.0.0.0',
 } ->

class { 'mysql::server':
  config_hash => { 'root_password' => 'local' },
} ->

mysql::db { 'rails_dev':
  user     => 'dev',
  password => 'local',
  host     => '%',
  grant    => ['all'],
} ->
class { 'mysql::ruby': } ->

package { 'libmagickwand-dev':
    ensure => "installed",
} -> 

package { 'imagemagick' :
ensure => 'installed',

}

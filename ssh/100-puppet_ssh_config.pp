#this file contains a puppet script that configs an ssh file.
file_line { 'Turn off passwd auth':
  path  => '/etc/ssh/ssh_config',
  line  => 'PasswordAuthentication no',
  match => '^PasswordAuthentication',
}

file_line { 'Declare identity file':
  path  => '/home/vagrant/.ssh/config',
  line  => 'IdentityFile ~/.ssh/school',
  match => '^IdentityFile',
}

file { '/home/vagrant/.ssh/config':
  ensure => file,
  owner  => 'ubuntu',
  group  => 'ubuntu',
  mode   => '0600',
}

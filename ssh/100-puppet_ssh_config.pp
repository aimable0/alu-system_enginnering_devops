file_line { 'Turn off passwd auth':
  path  => 'school',  # Modify this path as needed
  line  => 'PasswordAuthentication no',
  match => '^PasswordAuthentication',
}

file_line { 'Declare identity file':
  path  => '/home/vagrant/.ssh/config',  # Modify this path as needed
  line  => 'IdentityFile ~/.ssh/school',
  match => '^IdentityFile',
}

file { '/home/vagrant/.ssh/config':
  ensure => file,
  owner  => 'ubuntu',  # Modify the owner as per your environment
  group  => 'ubuntu',  # Modify the group as per your environment
  mode   => '0600',
}

#this file contains a puppet script that configs an ssh file.
# Disable password authentication in the SSH client config
file_line { 'Turn off passwd auth':
  path  => '/etc/ssh/ssh_config',  # Adjust this path if necessary
  line  => 'PasswordAuthentication no',
  match => '^PasswordAuthentication',
}

# Specify the identity file to use
file_line { 'Declare identity file':
  path  => '/home/vagrant/.ssh/config',  # Check if this is the right path for the user
  line  => 'IdentityFile ~/.ssh/school',
  match => '^IdentityFile',
}

# Ensure the SSH client config file exists with correct permissions
file { '/home/vagrant/.ssh/config':
  ensure => file,
  owner  => 'vagrant',   # Change this to 'vagrant' if running as vagrant user
  group  => 'vagrant',   # Change this to 'vagrant' if running as vagrant user
  mode   => '0600',
}


server '3.136.216.153', user: 'naoki', roles: %w{app db web}
set :ssh_options, keys: '~/.ssh/my_blog_key_rsa'
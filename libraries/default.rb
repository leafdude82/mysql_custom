def assign_root_password_cmd
  str = '/usr/bin/mysqladmin'
  str << ' -u root password '
  str << node['mysql']['server_root_password']
end

def install_grants_cmd
  str = '/usr/bin/mysql'
  str << ' -u root '
  node['mysql']['server_root_password'].empty? ? str << ' < /etc/mysql_grants.sql' : str << " -p#{node['mysql']['server_root_password']} < /etc/mysql_grants.sql"
end

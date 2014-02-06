#
# Cookbook Name:: mysql_custom
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "mysql-server" do 
	action :install
end

service "mysql-server" do
	supports :restart => true
	action :start
end

template "/" do
	source "mysql_custom.erb"
	mode 0644
	owner "root"
	group "root"
	variables ({
			:server_root_password => ['mysql_server']['server_root_password']
		})
	notifies :start, "service[mysql-server]", :delayed
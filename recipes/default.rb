#
# Cookbook Name:: ec2ab
# Recipe:: default
#
# Copyright 2014, bageljp
#
# All rights reserved - Do Not Redistribute
#

directory "#{node['ec2ab']['root_dir']}" do
  owner "#{node['ec2ab']['user']}"
  group "#{node['ec2ab']['group']}"
  mode 00755
  recursive true
end

#remote_file "#{node['ec2ab']['root_dir']}/ec2-automate-backup-awscli.sh" do
#  owner "#{node['ec2ab']['user']}"
#  group "#{node['ec2ab']['group']}"
#  mode 00755
#  source "#{node['ec2ab']['url']}"
#end

%w(
  ec2-automate-backup-awscli.sh
  ec2-automate-backup-env.sh
  ec2-automate-backup-base.sh
).each do |t|
  template "#{node['ec2ab']['root_dir']}/#{t}" do
    owner "#{node['ec2ab']['user']}"
    group "#{node['ec2ab']['group']}"
    mode 00755
  end
end

cron "EC2 automate backup" do
  user "#{node['ec2ab']['cron']['user']}"
  command "#{node['ec2ab']['root_dir']}/ec2-automate-backup-base.sh"
  hour "#{node['ec2ab']['cron']['hour']}"
  minute "#{node['ec2ab']['cron']['minute']}"
end


require 'rubygems'
require 'pp'
require 'right_api_client'
require 'yaml'
require 'uri'
require '../auth/session.rb'
require '../extras/simple_functions.rb'

# Written for API Course
# John Fitzpatrick, April 2013

lb_server_template_href = @client.server_templates.index(:filter => ['name==Load Balancer with HAProxy (v13.2.1) [RSED]']).first.href
app_server_template_href = @client.server_templates.index(:filter => ['name==PHP App Server (v13.2.1) [RSED]']).first.href
db_server_template_href = @client.server_templates.index(:filter => ['name==Database Manager for MySQL 5.5 (v13.2.1) [RSED]']).first.href


puts "What would you like to call your deployment?"
depname = STDIN.gets.chomp()
puts "What would you like to call your load balancer server?"
lbservname = STDIN.gets.chomp()
puts "What would you like to call your app server?"
appservname = STDIN.gets.chomp()
puts "What would you like to call your database server?"
bbservname = STDIN.gets.chomp()

puts "Creating Deployment...."
deploy_href = @client.deployments.create({:deployment => {:name => depname}}).href

puts "Creating LB Server...."
cloud = @client.clouds(:id => '1').show
 lbparams = { :server => {
 :name => lbservname,
 :deployment_href => deploy_href,
 :instance => {
   :server_template_href => lb_server_template_href,
   :cloud_href  => cloud.href,
   :security_group_hrefs => [cloud.security_groups.index(:filter => ['name==default']).first.href],
   :ssh_key_href  => cloud.ssh_keys.index.first.href,
   :datacenter_href  => cloud.datacenters.index.first.href
  }}}
newlb_server = @client.servers.create(lbparams)
newlb_server.api_methods

puts "Creating App Server...."
cloud = @client.clouds(:id => '1').show
 appparams = { :server => {
 :name => lbservname,
 :deployment_href => deploy_href,
 :instance => {
   :server_template_href => app_server_template_href,
   :cloud_href  => cloud.href,
   :security_group_hrefs => [cloud.security_groups.index(:filter => ['name==default']).first.href],
   :ssh_key_href  => cloud.ssh_keys.index.first.href,
   :datacenter_href  => cloud.datacenters.index.first.href
  }}}
newapp_server = @client.servers.create(appparams)
newapp_server.api_methods

puts "Creating DB Server...."
cloud = @client.clouds(:id => '1').show
 dbparams = { :server => {
 :name => lbservname,
 :deployment_href => deploy_href,
 :instance => {
   :server_template_href => db_server_template_href,
   :cloud_href  => cloud.href,
   :security_group_hrefs => [cloud.security_groups.index(:filter => ['name==default']).first.href],
   :ssh_key_href  => cloud.ssh_keys.index.first.href,
   :datacenter_href  => cloud.datacenters.index.first.href
  }}}
newdb_server = @client.servers.create(dbparams)
newdb_server.api_methods

#Set Inputs
puts "Setting Inputs..."
get_deployment(depname)
add_input('appapp/database_name','text:$DBSCHEMA')
add_input('appapp_php/modules_list','array:php53u-mysql,php53u-pecl-memcache')
add_input('applb/session_stickiness','text:false')
add_input('appweb_apache/mpm','text:prefork')
add_input('appdb/admin/user','text:adminuser')
add_input('appdb/admin/password','text:adminpassword')
add_input('appdb/application/user','text:appuser123')
add_input('appdb/application/password','text:apppasword123')
add_input('appdb/backup/lineage','text:$DBLINAGE')
add_input('appdb/dns/master/fqdn','text:$DBFQDN')
add_input('appdb/dns/master/id','text:$DDNSID')
add_input('appdb/dump/container','cred:DUMP_CONTAINER')
add_input('appdb/dump/database_name','text:$DBSCHEMA')
add_input('appdb/dump/prefix','text:sampledb')
add_input('appdb/dump/storage_account_id','cred:AWS_ACCESS_KEY_ID')
add_input('appdb/dump/storage_account_secret','cred:AWS_SECRET_ACCESS_KEY')
add_input('appdb/replication/user','text:repluser')
add_input('appdb/replication/password','text:replpassword')
add_input('appdb/provider_type','text:db_mysql_5.5')
add_input('apprepo/default/repository','text:git://github.com/rightscale/examples.git')
add_input('apprepo/default/revision','text:unified_php')
add_input('appsys_dns/choice','text:DNSMadeEasy')
add_input('appsys_dns/password','cred:DNS_PASSWORD')
add_input('appsys_dns/user','cred:DNS_USER')
deployment_set_inputs(@deployment, @inputs)

#Launch the Servers
puts "Starting Servers...."
newlb_server.show.launch
"\n"
puts "The Server '#{lbservname}' has been launched"
newapp_server.show.launch
"\n"
puts "The Server '#{appservname}' has been launched"
newdb_server.show.launch
"\n"
puts "The Server '#{dbservname}' has been launched"

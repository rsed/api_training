#!/usr/bin/ruby
#
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

def labinfo
  parsed_file=YAML.load(File.read(File.join(File.dirname(__FILE__),"labinfo.yaml")))
  @dbfqdn=parsed_file["inputs"]["dbfqdn"]
  @ddnsid=parsed_file["inputs"]["ddnsid"]
  @cloud=parsed_file["inputs"]["cloud"]
  @myname=parsed_file["inputs"]["myname"]
  @dblineage=parsed_file["inputs"]["dblineage"]
  @dbschema=parsed_file["inputs"]["dbschema"]
end

labinfo

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
add_inputs('app/database_name','text:#[dbschema]') #Cannot be missing (RuntimeError)
add_inputs('app_php/modules_list','array:php53u-mysql,php53u-pecl-memcache') #Unsupported input value
add_inputs('lb/session_stickiness','text:false')
add_inputs('web_apache/mpm','text:prefork')
add_inputs('db/admin/user','text:adminuser')
add_inputs('db/admin/password','text:adminpassword')
#add_inputs('db/application/user','text:appuser123') #The selected credential does not exist on this account
add_inputs('db/application/user','text:appuser') #The selected credential does not exist on this account
#add_inputs('db/application/password','text:apppasword123') #The selected credential does not exist on this account
add_inputs('db/application/password','text:apppasword') #The selected credential does not exist on this account
add_inputs('db/backup/lineage','text:$DBLINAGE')
add_inputs('db/dns/master/fqdn','text:#[dbfqdn]') #Cannot be missing
add_inputs('db/dns/master/id','text:#[ddnsid]')
add_inputs('db/dump/container','cred:DUMP_CONTAINER')
add_inputs('db/dump/database_name','text:#[dbschema]')
add_inputs('db/dump/prefix','text:sampledb')
add_inputs('db/dump/storage_account_id','cred:AWS_ACCESS_KEY_ID')
add_inputs('db/dump/storage_account_secret','cred:AWS_SECRET_ACCESS_KEY')
add_inputs('db/replication/user','text:repluser')
add_inputs('db/replication/password','text:replpassword')
add_inputs('db/provider_type','text:db_mysql_5.5') #Cannot be missing
add_inputs('db/provider_type','text:"db_mysql_5.5"') #Cannot be missing
add_inputs('repo/default/repository','text:git://github.com/rightscale/examples.git') #Cannot be missing!!
add_inputs('repo/default/repository','text:"git://github.com/rightscale/examples.git"') #Cannot be missing!!
add_inputs('repo/default/revision','text:unified_php')
add_inputs('sys_dns/choice','text:DNSMadeEasy')
add_inputs('sys_dns/password','cred:DNS_PASSWORD')
add_inputs('sys_dns/user','cred:DNS_USER')
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

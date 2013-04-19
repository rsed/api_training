#!/usr/bin/ruby
#
require 'rubygems'
require 'pp'
require 'right_api_client'
require 'yaml'
require 'uri'
#require '../auth/session.rb'
require '../extras/simple_functions.rb'


#Set Inputs
puts "Setting Inputs..."
get_deployment(deploy)
add_inputs('app/database_name','text:#[dbschema]')
#add_inputs('app_php/modules_list','array:php53u-mysql,php53u-pecl-memcache')
add_inputs('lb/session_stickiness','text:false')
add_inputs('web_apache/mpm','text:prefork')
add_inputs('db/admin/user','text:adminuser')
add_inputs('db/admin/password','text:adminpassword')
add_inputs('db/application/user','text:appuser123')
add_inputs('db/application/password','text:apppasword123')
add_inputs('db/backup/lineage','text:$DBLINAGE')
add_inputs('db/dns/master/fqdn','text:#[dbfqdn]')
add_inputs('db/dns/master/id','text:#[ddnsid]')
add_inputs('db/dump/container','cred:DUMP_CONTAINER')
add_inputs('db/dump/database_name','text:#[dbschema]')
add_inputs('db/dump/prefix','text:sampledb')
add_inputs('db/dump/storage_account_id','cred:AWS_ACCESS_KEY_ID')
add_inputs('db/dump/storage_account_secret','cred:AWS_SECRET_ACCESS_KEY')
add_inputs('db/replication/user','text:repluser')
add_inputs('db/replication/password','text:replpassword')
add_inputs('db/provider_type','text:db_mysql_5.5')
add_inputs('repo/default/repository','text:git://github.com/rightscale/examples.git')
add_inputs('repo/default/revision','text:unified_php')
add_inputs('sys_dns/choice','text:DNSMadeEasy')
add_inputs('sys_dns/password','cred:DNS_PASSWORD')
add_inputs('sys_dns/user','cred:DNS_USER')
deployment_set_inputs(@deployment, @inputs)


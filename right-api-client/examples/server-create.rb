require 'rubygems'
require 'pp'
require 'right_api_client'
require 'yaml'
require 'uri'
require './session.rb'


#def create_deployment(depname)
#  return @deployment=@client.deployments.create({:deployment => {:name => depname}})
#end

puts "What would you like to call your deployment?"
depname = STDIN.gets.chomp()

puts "What would you like to call your server?"
servname = STDIN.gets.chomp()

#create_deployment(depname)

deploy_href = @client.deployments.create({:deployment => {:name => depname}}).href

server_template_href = @client.server_templates.index(:filter => ['name==Base ServerTemplate']).first.href
cloud = @client.clouds(:id => '1').show
 params = { :server => {
 :name => servname,
 :deployment_href => deploy_href,
 :instance => {
   :server_template_href => server_template_href,
   :cloud_href  => cloud.href,
   :security_group_hrefs => [cloud.security_groups.index(:filter => ['name==default']).first.href],
   :ssh_key_href  => cloud.ssh_keys.index.first.href,
   :datacenter_href  => cloud.datacenters.index.first.href
  }}}
new_server = @client.servers.create(params)
new_server.api_methods
"\n"
puts "Complete.  Now go check the Dashboard"

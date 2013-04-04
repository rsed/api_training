require 'rubygems'
require 'pp'
require 'right_api_client'
require 'yaml'
require 'uri'

def labinfo
  parsed_file=YAML.load(File.read(File.join(File.dirname(__FILE__),"labinfo.yaml")))
  @dbfqdn=parsed_file["inputs"]["dbfqdn"]
  @ddnsid=parsed_file["inputs"]["ddnsid"]
  @cloud=parsed_file["inputs"]["cloud"]
  @myname=parsed_file["inputs"]["myname"]
  @dblineage=parsed_file["inputs"]["dblineage"]
  @dbschema=parsed_file["inputs"]["dbschema"]
end

cloud=@client.clouds(:id => '1').show

#mydeployment=@client.deployments.create({:deployment => {:name => [@myname.join(" Ruby Deploymemt")] }})
#mydeployment=@client.deployments.create({:deployment => {:name => [@myname + " Ruby Deploymemt"] }})
mydeployment=@client.deployments.create({:deployment => {:name => "Ruby Deploymemt" }})
 
lb_server_template_href = @client.server_templates.index(:filter => ['name==Load Balancer']).first.href
lb_server_template_href = @client.server_templates.index(:filter => ['name==Load Balancer']).first.href
app_server_template_href = @client.server_templates.index(:filter => ['name==Application']).first.href
app_server_template_href = @client.server_templates.index(:filter => ['name==Application']).first.href
db_server_template_href = @client.server_templates.index(:filter => ['name==Database']).first.href

lb_params = { :server => {
  :name => 'Test Server',
  :deployment_href => @client.deployments(:id => '3tier_deployment').show.href,
  :instance => {
    :server_template_href => lb_server_template_href,
    :cloud_href  => cloud.href,
    :security_group_hrefs => [cloud.security_groups.index(:filter => ['name==default']).first.href],
    :ssh_key_href  => cloud.ssh_keys.index.first.href,
    :datacenter_href  => cloud.datacenters.index.first.href
   }}}

app_params = { :server => {
  :name => 'Test Server',
  :deployment_href => @client.deployments(:id => '3tier_deployment').show.href,
  :instance => {
    :server_template_href => app_server_template_href,
    :cloud_href  => cloud.href,
    :security_group_hrefs => [cloud.security_groups.index(:filter => ['name==default']).first.href],
    :ssh_key_href  => cloud.ssh_keys.index.first.href,
    :datacenter_href  => cloud.datacenters.index.first.href
   }}}

db_params = { :server => {
  :name => 'Test Server',
  :deployment_href => @client.deployments(:id => '3tier_deployment').show.href,
  :instance => {
    :server_template_href => db_server_template_href,
    :cloud_href  => cloud.href,
    :security_group_hrefs => [cloud.security_groups.index(:filter => ['name==default']).first.href],
    :ssh_key_href  => cloud.ssh_keys.index.first.href,
    :datacenter_href  => cloud.datacenters.index.first.href
   }}}

new_lb_server = @client.servers.create(lb_params)
new_app_server = @client.servers.create(app_params)
new_db_server = @client.servers.create(db_params)
 
new_server.api_methods

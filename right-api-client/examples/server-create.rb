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

server_template_href = @client.server_templates.index(:filter => ['name==Base ServerTemplate']).first.href
  cloud = @client.clouds(:id => '1').show
  params = { :server => {
  :name => 'Test Server',
  :deployment_href => @client.deployments(:id => '373168003').show.href,
  :instance => {
    :server_template_href => server_template_href,
    :cloud_href  => cloud.href,
    :security_group_hrefs => [cloud.security_groups.index(:filter => ['name==default']).first.href],
    :ssh_key_href  => cloud.ssh_keys.index.first.href,
    :datacenter_href  => cloud.datacenters.index.first.href
   }}}
  new_server = @client.servers.create(params)
  new_server.api_methods
 


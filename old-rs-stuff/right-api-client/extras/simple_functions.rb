require 'rubygems'
require 'pp'
require 'right_api_client'
require 'yaml'
require 'uri'

def show_deployments
  pp @client.deployments.index
end

def show_servers
  pp @client.servers.index
end

def show_templates
  pp @client.server_templates.index
end

def show_servers_in_deployment(id)
 pp @client.deployments(:id => id).show.servers.index
end

def validate_input(value)
  case value.split(':').first
    when 'key'
      puts "key '#{value}'"
    when 'text'
      puts "text '#{value}'"
    when 'cred'
      puts "cred '#{value}'"
    when 'array'
      puts "array '#{value}'"
    else
      raise "Unsupported input value"
  end
end

def add_inputs(name,value)
  @inputs = Array.new unless @inputs
  validate_input(value)
  @inputs << { name => value }
end

#usage list_inputs(@inputs)
def list_inputs(inputs)
  counter=0
  inputs_string=""
  inputs.each do |i|
    i.each do |k,v|
      counter +=1
      inputs_string += "inputs[][name]=#{URI.encode(k)}&inputs[][value]=#{v}"
      inputs_string += "&" unless counter >= inputs.length
    end
  end
  return inputs_string
end

def set_cloud_href(cloud_id)
  return @cloud_href="/api/clouds/#{cloud_id}"
end

def create_deployment(name)
  return @deployment=@client.deployments.create({:deployment => {:name => name}})
end

def get_deployment(name)
  return @deployment=@client.deployments.index(:name => name).first
end

def deployment_set_inputs(deployment,inputs)
  ###deployment.show().inputs.multi_update(list_inputs(inputs))
  deployment().show.inputs.multi_update(list_inputs(inputs))
end

def get_server_template(name)
  return @server_template=@client.server_templates.index(:filter => ['name==Base ServerTemplate']).first
end

def create_server_hash(name,deployment_href,cloud_href,template_href)
  return @server_hash={
    :name => "#{name}",
    :deployment_href => deployment_href,
    :instance => {
      :cloud_href => cloud_href,
      :server_template_href => template_href
    }
  }
end

#Usage create_server(@deployment,create_server_hash('test-server',set_cloud_href(123),261376001))
def create_server(deployment, hash)
  deployment.show().servers.create(:server => hash)
end


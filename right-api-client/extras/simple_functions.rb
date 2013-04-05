require 'rubygems'
require 'pp'
require 'right_api_client'
require 'yaml'
require 'uri'

def init_auth
  parsed_file=YAML.load(File.read(File.join(File.dirname(__FILE__),"apirc")))
  @user=parsed_file["defaults"]["user"]
  @pass=parsed_file["defaults"]["pass"]
  @account=parsed_file["defaults"]["account"]
end
 
@client=''
def init_client(email,pass,id)
  @client = RightApi::Client.new(:api_url => 'https://us-3.rightscale.com', :email => email, :password => pass, :account_id => id)
  puts "Available methods: #{pp @client.api_methods}"
end

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
      puts "key value"
    when 'text'
      puts "text value"
    when 'cred'
      puts "cred"
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
  deployment.show().inputs.multi_update(list_inputs(inputs))
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

def enterprise_child_accounts_show
  @client.child_accounts.index
end

def enterprise_child_accounts_create(name)
  return @new_child_account = @client.child_accounts.create(:child_account => {:name => "#{name}"})
end

def enterprise_get_current_child_account(name)
  return @current_child=@client.child_accounts.index(:filter => "name==#{name}").first
end

def enterprise_child_account_login(child_account,user,pass)
  puts "Loggin into child account: #{child_account.href.split('/').last}"
  return @sub_account_client = RightApi::Client.new(:email => user, :password => pass, :account_id => child_account.href.split('/').last)
end

def enterprise_child_account_aws_credential_add(child_client,aws_account_number,aws_access_key_id,aws_secret_access_key,ec2_cert=nil,ec2_key=nil)
  child_client.cloud_accounts.create(:cloud_account => {
                                        :cloud_href => "aws",
                                        :creds => {
                                          :aws_account_number => "#{aws_account_number}",
                                          :aws_access_key_id => "#{aws_access_key_id}",
                                          :aws_secret_access_key => "#{aws_secret_access_key}",
                                          :ec2_cert => '',
                                          :ec2_key => ''
                                        }
                                      } )
end

def enterprise_child_account_generic_credential_add(child_client,token,cloud_owner,access_key_id,secret_access_key)
 child_client.cloud_accounts.create(:cloud_account => {
                                      :cloud_href => "#{cloud_href}",
                                      :creds => {
                                        :token => "#{token}",
                                        :cloud_owner => "#{cloud_owner}",
                                        :access_key_id => "#{access_key_id}",
                                        :secret_access_key => "#{secret_access_key}"
                                      }
                                    } )
end

def enterprise_child_account_rename(old_name, new_name)
  @client.child_accounts.index(:filter => "name==#{old_name}").first.update({ :child_account =>{:name => "#{new_name}"} })
end

#always last item
def init
  init_auth
  init_client(@user,@pass,@account)
end

init
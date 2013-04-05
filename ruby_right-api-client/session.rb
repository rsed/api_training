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
  @apiurl=parsed_file["defaults"]["apiurl"]
end
 
@client=''
def init_client(apiurl,email,pass,id)
  @client = RightApi::Client.new(:api_url => apiurl, :email => email, :password => pass, :account_id => id)
  puts "Authenticated"
  puts "Available methods: #{pp @client.api_methods}"
end

def init
  init_auth
  init_client(@apiurl,@user,@pass,@account)
end

init

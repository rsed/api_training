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


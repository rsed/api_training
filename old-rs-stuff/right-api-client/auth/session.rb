require 'rubygems'
require 'pp'
require 'right_api_client'
require 'yaml'
require 'uri'

def init_auth
  parsed_file=YAML.load(File.read(File.join(File.dirname(__FILE__),"apirc")))
  @user=parsed_file["defaults"]["user"]
# @pass=parsed_file["defaults"]["pass"]
  @account=parsed_file["defaults"]["account"]
  @apiurl=parsed_file["defaults"]["apiurl"]
end
 
def password
 puts "Please enter your account password:-"
 `stty -echo`
 @mypassword = STDIN.gets.chomp()
 `stty echo`
end

@client=''
def init_client(apiurl,email,mypassword,id)
  @client = RightApi::Client.new(:api_url => apiurl, :email => email, :password => mypassword, :account_id => id)
  puts "Authenticated"
#  puts "Available methods: #{pp @client.api_methods}"
end

def init
  init_auth
  password
  init_client(@apiurl,@user,@mypassword,@account)
end

init

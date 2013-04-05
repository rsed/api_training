# Script:  authenticate - Establish authentication with the RS API.  Requires rubygems and right_api_client. 
# Authentication credentials stored in memory (not a cookie/file on local disk)
# you must 'run gem install right_api_client' to install right_api_client before executing this script

require 'rubygems'
require 'pp'                 # require the pp Pretty Print rubygem. 
require 'right_api_client'

@client = RightApi::Client.new(:api_url => 'https://us-3.rightscale.com', :email => 'myemail@example.com', :password_base64 => 'mypassword', :account_id => '12345')

puts "Available methods: #{pp @client.api_methods}"    # Use pretty print for more readable output
#puts "Available methods: #{@client.api_methods}"      # Use standard puts call.  Less readable.  Commented out so it will not be executed.


#def show_deployments
#  pp @client.deployments.index
#end

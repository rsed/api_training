# Script:  authenticate - Establish authentication with the RS API.  Requires rubygems and right_api_client. 
# Authentication credentials stored in memory (not a cookie/file on local disk)
# you must 'run gem install right_api_client' to install right_api_client before executing this script

require 'rubygems'
require 'pp'                 # require the pp Pretty Print rubygem. 
require 'right_api_client'

my_token="33172:46abe5011c8a5d9..."
my_account_id="33172"

@instance_client = RightApi::Client.new(:api_url => 'https://us-3.rightscale.com', :instance_token => 'my_token', :account_id => 'my_account_id')
#@instance_client = RightApi::Client.new(:api_url => 'https://us-3.rightscale.com', :instance_token => 'my_token')


#puts "Available methods: #{pp @client.api_methods}"    # Use pretty print for more readable output
#puts "Available methods: #{@client.api_methods}"      # Use standard puts call.  Less readable.  Commented out so it will not be executed.


#def show_deployments
#  pp @client.deployments.index
#end

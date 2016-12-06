class Glibrary < ApplicationRecord
  include HTTParty
  require 'awesome_print'
  format :json
  default_options.update(verify: false)
  base_uri "https://glibrary.ct.infn.it:3500/v2"
  # We need a means to check whether an existing token is valid
  # The token is given with a TTL. The TTL should be compared
  # with the current time to see if there is a need to refresh it

  def self.get_token(username, password)
    puts 'entering get_token'
    @username = username
    @password = password
    headers = 'Content-Type:application/json'
    $glibrary_response = self.post(base_uri + '/users/login',
      :body => {"username" => @username, "password"=> @password},
      :headers => @headers)

    token = $glibrary_response['id']
    # puts "token is " + token.to_s
    ttl = $glibrary_response['ttl']
    # puts "ttl is " + ttl.to_s
    created = $glibrary_response['created']
    # puts "token created at " + created.to_s

    token_created = DateTime.rfc3339($glibrary_response['created']).to_time.to_i
    $token_expires = token_created + ttl.to_i
    time_remaining = $token_expires.to_i - (Time.now.to_i)
    # puts "token expires  at " + Time.at($token_expires.to_i).to_datetime.to_s
    # puts "time left " + (time_remaining).to_s
    # puts "exiting 'get_token'"

  end

  def self.collections

    @collections = self.get( base_uri + "/repos/nwu_hlt",
    :headers => {'Authorization' => $glibrary_response['id']} )
    @collections.each do |collection|
      ap collection.to_json
    end
  end
end

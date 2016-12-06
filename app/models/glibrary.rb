class Glibrary < ApplicationRecord
  include HTTParty
  base_uri "https://glibrary.ct.infn.it:3500/v2"
  def self.get_token(username, password)
    @username = username
    @password = password
    headers = 'Content-Type:application/json'
    p @username
    p @password
    p @headers
    response = self.post(base_uri + '/users/login',
      :body => {"username" => @username, "password"=> @password},
      :headers => @headers)
      p response
    return response['id']
  end
end

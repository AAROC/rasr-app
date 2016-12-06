require 'httparty'
require 'json'
require 'awesome_print'
api_url = 'https://glibrary.ct.infn.it:3500/v2/'
user = 'brucellino'
pass = 'EQXIovD0tId4JqV4_CWGNHEzF9HYA4nk'
login_url = 'users/login/'
collections_url = 'repos/nwu_hlt/'
body = { :username => user,
          :password => pass
         }
headers = {'Content-Type' => 'Application/json'}
response=HTTParty.post(api_url + login_url,
                  :body =>  body ,
                  :options =>  headers
                   )
ap response
token = response['id']

collections = HTTParty.get(api_url + collections_url,
                headers: {"Content-Type" => "application/json",
                          "Authorization" => token }
                          )
ap collections

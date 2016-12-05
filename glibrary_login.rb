require 'httparty'
require 'json'
require 'awesome_print'
api_url = 'https://glibrary.ct.infn.it:3500/v2/'
user = 'brucellino'
pass = 'EQXIovD0tId4JqV4_CWGNHEzF9HYA4nk'
login_url = 'users/login/'
body = { :username => user,
          :password => pass
         }
headers = {'Content-Type' => 'Application/json'}
response=HTTParty.post(api_url + login_url,
                  :body =>  body ,
                  :options =>  headers
                   )
ap response

require "oauth2"
require "dotenv"

Dotenv.load('.env')

client = 
OAuth2::Client.new(
	ENV['UID'],
	ENV['SECRET'],
	site: "https://api.intra.42.fr")

token = Hash.new
token = client.client_credentials.get_token

puts token.token

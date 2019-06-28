class Recipe

	include HTTParty
=begin

We declare enviromental variable by typing on terminal: 
export FOOD2FORK_KEY="7c31713c86070bba24d43ecacb5b05a4" (Our key generated when signed up)
and we can check it is well created by typing: ruby -e 'p ENV["FOOD2FORK_KEY"]'

=end

	hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'www.food2fork.com'
	base_uri "http://#{hostport}/api"

	default_params key: ENV["FOOD2FORK_KEY"]
  	format :json

  	#Keyword is what we are looking for
	def self.for (keyword)
		#1st argument: default params and /search route
		#2nd argument: the query request parameter (&query=) and inside the hash we select recipes 
		get("/search", query: {q: keyword})["recipes"]
	end

end

require 'json'
require 'httparty'

class DadApi
  include HTTParty
  headers "Accept" => "application/json"
  attr_accessor :dad_joke

  base_uri 'https://icanhazdadjoke.com'

  def get_dad_joke
    @dad_joke = JSON::parse(self.class.get("/search").body)
  end

  def get_dad_joke_length
    @dad_joke.length
  end

  def get_limit
    @dad_joke['limit']
  end

  def get_status
    @dad_joke['status']
  end

  def get_current_page
    @dad_joke["current_page"]
  end

  def get_next_page
    @dad_joke["next_page"]
  end

  def get_results
    @dad_joke["results"]
  end

  def get_results_hash_length
    get_results.length
  end

  def get_total_jokes
    @dad_joke["total_jokes"]
  end

  def get_total_pages
    @dad_joke["total_pages"]
  end

end

# x = DadApi.new
# puts x.get_dad_joke['results'][0]['joke']

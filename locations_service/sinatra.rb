require 'sinatra'
require 'faraday'
require 'pry'

get '/bathrooms' do
  number_of_results = 10 #params['number_of_results']
  latitude = params['latitude'].to_f
  longitude = params['longitude'].to_f
  get_json(number_of_results, latitude, longitude).to_json
end

def get_json(number_of_results, latitude, longitude)
  binding.pry
  # response = conn.get(https://www.refugerestrooms.org/api/v1/restrooms/by_location?page=1&per_page=10&offset=0&lat=39.750865&lng=-104.9966132)
  # response = Faraday.get("https://www.refugerestrooms.org/api/v1/restrooms/by_location?page=1&per_page=#{number_of_results}&offset=0&ada=false&unisex=false&lat=#{latitude}&lng=#{longitude}")
  response = Faraday.get("by_location?page=1&per_page=10&offset=0&lat=39.750865&lng=-104.9966132"
 
  # the below is something we may want to look into something like this. Could be easier for sinatra. However the above works.  
    # Faraday.new(https://www.refugerestrooms.org/api/v1/restrooms/) do |c|
    #   c.params["lat"] = 39.75
    #   c.headers["key"] = ENV["KEY_VALUE"]
    #   c.params['lng'] = 104.99
    # end

  JSON.parse(response.body, symbolize_names: true)
end

# def conn
#   Faraday.new(url: 'https://www.refugerestrooms.org/api/v1/restrooms')
# end

# 
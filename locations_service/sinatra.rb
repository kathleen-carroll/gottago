require 'sinatra'
require 'faraday'

get '/bathrooms' do
  number_of_results = params['number_of_results']
  latitude = params['latitude'].to_f
  longitude = params['longitude'].to_f

  get_json(number_of_results, latitude, longitude).to_json
end

def get_json(number_of_results, latitude, longitude)
  response = conn.get("/api/v1/restrooms/by_location?page=1&per_page=#{number_of_results}&offset=0&ada=false&unisex=false&lat=#{latitude}&lng=#{longitude}")
  JSON.parse(response.body, symbolize_names: true)
end

def conn
  Faraday.new(url: 'https://www.refugerestrooms.org/api/v1/restrooms')
end

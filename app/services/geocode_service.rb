class GeocodeService
  def geocall(query)
    response = conn(query).post

    get_coordinates(response)
  end

  private

  def get_coordinates(response)
    location = JSON.parse(response.body, symbolize_names: true)
    location[:results].first[:geometry][:location]
  end

  def conn(query)
    Faraday.new(url:"https://maps.googleapis.com/maps/api/geocode/json?address=#{query}&key=#{ENV['GOOGLE_API_KEY']}")
  end
end

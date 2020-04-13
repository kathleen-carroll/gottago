
desc "Create Denver Bathrooms"
  task :bathroom => [:environment] do
    Bathroom.destroy_all
    response = Faraday.get("https://www.refugerestrooms.org/api/v1/restrooms/by_location?page=1&per_page=100&offset=0&lat=39.7392&lng=-104.9903")
    data = JSON.parse(response.body, symbolize_names: true)
    data.each do |bathroom|
      Bathroom.create(
        name:           bathroom[:name],
        street:         bathroom[:street],
        city:           bathroom[:city],
        state:          bathroom[:state],
        accessible:     bathroom[:accessible],
        unisex:         bathroom[:unisex],
        changing_table: bathroom[:changing_table],
        latitude:       bathroom[:latitude],
        longitude:      bathroom[:longitude])
    end 
    puts "created #{Bathroom.count} Denver Bathrooms!"
  end

desc "Create Colorado Springs Bathrooms"
  task :bathroom => [:environment] do
    Bathroom.destroy_all
    response = Faraday.get("https://www.refugerestrooms.org/api/v1/restrooms/by_location?page=1&per_page=100&offset=0&lat=38.8339&lng=-104.8214")
    data = JSON.parse(response.body, symbolize_names: true)
    data.each do |bathroom|
      Bathroom.create(
        name:           bathroom[:name],
        street:         bathroom[:street],
        city:           bathroom[:city],
        state:          bathroom[:state],
        accessible:     bathroom[:accessible],
        unisex:         bathroom[:unisex],
        changing_table: bathroom[:changing_table],
        latitude:       bathroom[:latitude],
        longitude:      bathroom[:longitude])
    end 
    puts "created #{Bathroom.count} Colorado Springs Bathrooms!"
  end

desc "Create Boulder Bathrooms"
  task :bathroom => [:environment] do
    Bathroom.destroy_all
    response = Faraday.get("https://www.refugerestrooms.org/api/v1/restrooms/by_location?page=1&per_page=100&offset=0&lat=40.0150&lng=-105.2705")
    data = JSON.parse(response.body, symbolize_names: true)
    data.each do |bathroom|
      Bathroom.create(
        name:           bathroom[:name],
        street:         bathroom[:street],
        city:           bathroom[:city],
        state:          bathroom[:state],
        accessible:     bathroom[:accessible],
        unisex:         bathroom[:unisex],
        changing_table: bathroom[:changing_table],
        latitude:       bathroom[:latitude],
        longitude:      bathroom[:longitude])
    end 
    puts "created #{Bathroom.count} Boulder Bathrooms!"
  end
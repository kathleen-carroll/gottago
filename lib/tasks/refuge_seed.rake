
desc "Create Denver Bathrooms"
  task :bathroom => [:environment] do
    page = 1
    count = 100
    until count < 100
      response = Faraday.get("https://www.refugerestrooms.org/api/v1/restrooms?page=#{page}&per_page=100&offset=0")
      data = JSON.parse(response.body, symbolize_names: true)
      data.each do |bathroom|
        require "pry"; binding.pry
        unless Bathroom.all.select { |location| bathroom[:id].to_s == location.refuge_id }
          Bathroom.create(
            name:           bathroom[:name],
            street:         bathroom[:street],
            city:           bathroom[:city],
            state:          bathroom[:state],
            accessible:     bathroom[:accessible],
            unisex:         bathroom[:unisex],
            changing_table: bathroom[:changing_table],
            latitude:       bathroom[:latitude],
            longitude:      bathroom[:longitude],
            refuge_id:      bathroom[:id])
        end 
      end
      puts "created #{Bathroom.count} bathrooms!"
      page += 1
      count = data.count
    end
  end

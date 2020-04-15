
desc "Create Denver Bathrooms"
  task :bathroom => [:environment] do
    Bathroom.destroy_all
    page = 1
    count = 100
    until count < 100
      response = Faraday.get("https://gottago-sinatra.herokuapp.com/api/v1/all?page=#{page}")
      data = JSON.parse(response.body, symbolize_names: true)
      data.each do |bathroom|
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

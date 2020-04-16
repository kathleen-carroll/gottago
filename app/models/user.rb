class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :omniauthable, :omniauth_providers => [:facebook]
  geocoded_by :address #:address, :latitude => :lat, :longitude => :long #:address
  after_validation :geocode

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
      user.token = auth.credentials.token
    end
  end

  def address
    # @geoip_city = GeoIP.new('lib/GeoLiteCity.dat').city(request.remote_ip)

    conn = Faraday.new(url:"https://www.googleapis.com/geolocation/v1/geolocate?key=#{ENV['GOOGLE_API_KEY']}")
    response = conn.post
    current = JSON.parse(response.body, symbolize_names: true)
  end

end

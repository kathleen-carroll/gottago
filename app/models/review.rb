class Review < ApplicationRecord
  belongs_to :user
  belongs_to :bathroom

  enum rating: %w(nil disliked liked loved), _suffix: true

  enum experience: %w(nil disliked liked loved), _prefix: :experience
  enum cleanliness: %w(nil disliked liked loved), _prefix: :cleanliness
  enum smell: %w(nil disliked liked loved), _prefix: :smell
  

end 
class Review < ApplicationRecord
  belongs_to :user
  belongs_to :bathroom

  enum rating: %w(disliked liked loved), _suffix: true

  enum experience: %w(disliked liked loved), _prefix: :experience
  enum cleanliness: %w(disliked liked loved), _prefix: :cleanliness
  enum smell: %w(disliked liked loved), _prefix: :smell
  

end 
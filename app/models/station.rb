class Station < ApplicationRecord
  belongs_to :room, inverse_of: :stations
end

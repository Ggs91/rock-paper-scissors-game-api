class Game < ApplicationRecord
  validates :winner, presence: true
end

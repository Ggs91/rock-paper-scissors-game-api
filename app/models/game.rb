class Game < ApplicationRecord
  validates :winner, presence: true
  has_many :players
end

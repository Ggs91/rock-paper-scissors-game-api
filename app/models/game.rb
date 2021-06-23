class Game < ApplicationRecord
  validates :winner, presence: true, on: :update
  has_many :players
end

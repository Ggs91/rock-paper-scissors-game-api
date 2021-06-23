class Player < ApplicationRecord
  validates :name, presence: true
  belongs_to :game
  has_one :hand_move
end

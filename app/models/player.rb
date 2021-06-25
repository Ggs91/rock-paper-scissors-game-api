class Player < ApplicationRecord
  validates :name, presence: true
  belongs_to :game, optional: true
  has_one :hand_move
end

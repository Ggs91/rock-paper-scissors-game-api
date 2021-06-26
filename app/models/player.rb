class Player < ApplicationRecord
  validates_presence_of :name, presence: true, message: "Please enter a name"
  belongs_to :game, optional: true
  has_one :hand_move
end

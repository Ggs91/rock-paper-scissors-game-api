class Player < ApplicationRecord
  validates_presence_of :name, presence: true, message: "Please enter a name"
  validates :hand_move, inclusion: { in: %w(rock paper scissors),
    message: "only 'rock', 'paper' and 'scissors' are accepted" }
  belongs_to :game, optional: true
end

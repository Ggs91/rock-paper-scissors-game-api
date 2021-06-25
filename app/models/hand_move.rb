class HandMove < ApplicationRecord
  validates :name, inclusion: { in: %w(rock paper scissors),
    message: "only 'rock', 'paper' and 'scissors' are accepted" }
  belongs_to :player, optional: true
end

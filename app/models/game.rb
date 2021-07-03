class Game < ApplicationRecord
  has_many :players
  has_one :winner, class_name: 'Player', foreign_key: 'won_game_id'

  def result
    self.winner.nil? ? 'tie' : "#{self.winner.name} wins"
  end
end

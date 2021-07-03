class Game < ApplicationRecord
  has_many :players
  has_one :winner, class_name: 'Player'

  def result
    self.winner.nil? ? 'tie' : "#{self.winner.name} won"
  end
end

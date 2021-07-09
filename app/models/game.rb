class Game < ApplicationRecord
  has_many :players
  has_one :winner, class_name: 'Player', foreign_key: 'won_game_id'
  accepts_nested_attributes_for :players
  validate :two_players

  NB_PLAYERS = 2
  MOVES = %w{rock paper scissors}

  def result
    self.winner.nil? ? 'tie' : "#{self.winner.name} won"
  end

  private

  def two_players
    errors.add(:players, 'Two players required') unless self.players.size == NB_PLAYERS
  end
end

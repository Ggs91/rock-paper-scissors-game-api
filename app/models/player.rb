class Player < ApplicationRecord
  validates_presence_of :name, message: "Please enter a name"
  validates :move, inclusion: { in: Game::MOVES,
    message: "Only 'rock', 'paper' and 'scissors' are accepted" }

  belongs_to :game

  def bot
    self.name = 'Bot'
    self.move = random_move

    self
  end

  private

  def random_move
    Game::MOVES.sample
  end
end

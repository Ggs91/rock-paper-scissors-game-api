class Player < ApplicationRecord
  validates_presence_of :name, presence: true, message: "Please enter a name"
  validates :move, inclusion: { in: %w(rock paper scissors),
    message: "only 'rock', 'paper' and 'scissors' are accepted" }

  belongs_to :game

  def bot
    self.name = 'Bot'
    self.move = random_move

    self
  end

  private

  def random_move
    %w{rock paper scissors}.sample
  end
end

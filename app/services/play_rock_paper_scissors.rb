class PlayRockPaperScissors
  def initialize(game)
    @game = game
    @player_1 = @game.players.first
    @player_2 = @game.players.second
  end

  def perform
    result = winning_move(@player_1.move, @player_2.move)
    set_winner(result)
    @game.update(winner: @winner, played: true)
  end

private

  def winning_move(first_move, second_move)
    if (first_move == 'rock' && second_move == 'paper') || (second_move == 'rock' && first_move == 'paper')
      'paper'
    elsif (first_move == 'rock' && second_move == 'scissors') || (second_move == 'rock' && first_move == 'scissors')
      'rock'
    elsif (first_move == 'paper' && second_move == 'scissors') || (second_move == 'paper' && first_move == 'scissors')
      'scissors'
    else
      nil
    end
  end

  def set_winner(winning_move)
    return if winning_move.nil?
    @winner = @player_1.move == winning_move ? @player_1 : @player_2
  end
end

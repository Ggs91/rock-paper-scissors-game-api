class PlayRockPaperScissors
  def initialize(players)
    @player = players[:players][:player]
    @bot = players[:players][:bot]
    @winner = nil
  end

  def perform
    bot_play
    result = winning_move(@player.hand_move.name, @bot.hand_move.name)
    set_winner(result)
    {
      players: [@player, @bot],
      winner: @winner,
    }
  end

  private

  def bot_play
    bot_move = %w{rock paper scissors}.sample
    @bot.hand_move = HandMove.find_by(name: bot_move)
  end

  def winning_move(first_move, second_move)
    if (first_move == 'rock' && second_move == 'paper') || (second_move == 'rock' && first_move == 'paper')
      return 'paper'
    elsif (first_move == 'rock' && second_move == 'scissors') || (second_move == 'rock' && first_move == 'scissors')
      return 'rock'
    elsif (first_move == 'paper' && second_move == 'scissors') || (second_move == 'paper' && first_move == 'scissors')
      return 'scissors'
    else
      return nil
    end
  end

  def set_winner(winning_move)
    return if winning_move.nil?
    @winner = @player.hand_move.name == winning_move ? @player : @bot
  end
end

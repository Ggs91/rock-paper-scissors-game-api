class PlayRockPaperScissors
  def initialize(player)
    @player = player
    @winner = nil
  end

  def perform
    create_bot
    result = winning_move(@player.hand_move, @bot.hand_move)
    set_winner(result)
    {
      players: {
        player: @player,
        bot: @bot
      },
      winner: @winner
    }
  end

  private

  def create_bot
    bot_move = %w{rock paper scissors}.sample
    @bot = Player.create(name: 'Bot', hand_move: bot_move)
  end

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
    @winner = @player.hand_move == winning_move ? @player : @bot
  end
end

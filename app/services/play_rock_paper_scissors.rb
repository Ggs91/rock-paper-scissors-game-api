class PlayRockPaperScissors
  def initialize(player)
    @player = player
    @winner = nil
  end

  def perform
    create_bot
    result = winning_move(@player.hand_move.name, @bot.hand_move.name)
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
    @bot = Player.new(name: 'Bot')
    bot_move = %w{rock paper scissors}.sample
    @bot.hand_move = HandMove.create(name: bot_move)
    @bot.save
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

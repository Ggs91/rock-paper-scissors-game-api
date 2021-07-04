class PlayersInitializer
  def initialize(player_params)
    @player_params = player_params
    @errors = nil
  end

  def perform
    create_player
    create_bot
    {
      errors: @errors,
      players: {
        player_1: @player,
        player_2: @bot
      }
    }
  end

  private

  def create_player
    initialize_player
    validate_player
  end

  def initialize_player
    @player = Player.new(@player_params)
  end

  def validate_player
    @errors = @player.errors.full_messages unless @player.save
  end

  def create_bot
    bot_move = %w{rock paper scissors}.sample
    @bot = Player.create(name: 'Bot', move: bot_move) if @player.persisted?
  end
end

class PlayersInitializer
  def initialize(params)
    @params = params
    @errors = []
  end

  def perform
    create_bot
    create_player
    player_play
    {
      errors: @errors,
      players: {
        player: @player,
        bot: @bot
      }
    }
  end

  private

  def create_player
    initialize_player
    validate_player
  end

  def initialize_player
    @player = Player.new(name: @params[:name])
  end

  def validate_player
    @errors << @player.errors.messages.values.flatten unless @player.save
  end

  def set_player_move
    @player.hand_move = @player_hand_move
  end

  def player_play
    unless @player_hand_move = HandMove.find_by(name: @params[:move])
      @errors << "only 'rock', 'paper' and 'scissors' are accepted" && return
    end

    set_player_move
  end

  def create_bot
    @bot = Player.create(name: 'Bot')
  end
end

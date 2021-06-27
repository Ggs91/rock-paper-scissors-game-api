class PlayerInitializer
  def initialize(params)
    @params = params
    @errors = []
  end

  def perform
    create_player
    {
      errors: @errors,
      player: @player,
    }
  end

  private

  def create_player
    initialize_player
    validate_player
  end

  # def create_player
  #   @player = Player.new(name: @params[:name])

  # end

  def initialize_player
    @player = Player.new(name: @params[:name])
    set_player_move
  end

  def validate_player
    @errors << @player.errors.full_messages unless @player.save
    # @errors << @player.errors.messages.values.flatten unless @player.save
  end

  def set_player_move
    # @player.hand_move = @player_hand_move if valid_hand_move?
    unless @player.hand_move = HandMove.create(name: @params[:move])

    end
  end

  def valid_hand_move?
    unless @player_hand_move = HandMove.create(name: @params[:move], player: @player)
      # @errors << "only 'rock', 'paper' and 'scissors' are accepted" && return
      @errors << @player_hand_move.errors.full_messages
      return false
    end

    true
  end
  # def player_play #player peuv être créer sans move en db. emepecher ca

  #   set_player_move
  # end
end
    # @bot = Player.create(name: 'Bot')

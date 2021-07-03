class PlayerInitializer
  def initialize(player_params)
    @player_params = player_params
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

  def initialize_player
    @player = Player.new(@player_params)
  end

  def validate_player
    @errors << @player.errors.full_messages unless @player.save
  end
end

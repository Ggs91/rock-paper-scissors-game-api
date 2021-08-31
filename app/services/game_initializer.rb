class GameInitializer
  def initialize(game_params)
    @players_attributes = [game_params]
  end

  def perform
    new_game = Game.new
    add_player(new_game)
    add_bot_player(new_game)

    new_game
  end

private

  def add_player(game)
    game.players_attributes = @players_attributes
  end

  def add_bot_player(game)
    game.players << Player.new.bot
  end
end

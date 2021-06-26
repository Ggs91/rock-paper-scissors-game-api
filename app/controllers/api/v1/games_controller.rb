class Api::V1::GamesController < ApplicationController
  def index
    @games = Game.order(created_at: :desc)
  end

  def create
    initialized_players = PlayersInitializer.new(params).perform

    if initialized_players[:errors].any?
      render json: result[:errors], status: :unprocessable_entity
    else
      game = Game.new
      game.players << [initialized_players[:players][:player], initialized_players[:players][:bot]]
      game_result = PlayRockPaperScissors.new(initialized_players).perform
      game.winner = game_result[:winner]

      if game.save
        render json: {
          moves: [
            {
              name: game.players.first.name,
              move: game.players.first.hand_move.name
            },
            {
              name: game.players.second.name,
              move: game.players.second.hand_move.name
            }
          ],
          result: game.result
        },
        status: :created
      else
        render json: game.errors, status: :unprocessable_entity
      end
    end
  end

end

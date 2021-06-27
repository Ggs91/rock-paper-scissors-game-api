class Api::V1::GamesController < ApplicationController
  def index
    @games = Game.order(created_at: :desc)
  end

  def create
    initialized_player = PlayerInitializer.new(params).perform
    if initialized_player[:errors].any?
      render json: initialized_player[:errors], status: :unprocessable_entity
    else
      game = Game.new
      game_result = PlayRockPaperScissors.new(initialized_player[:player]).perform
      game.players << [game_result[:players][:player], game_result[:players][:bot]]
      game.winner = game_result[:winner]

      if game.save
        render json: {
          moves: [
            {
              name: game.players.first.name,
              move: game.players.first.hand_move
            },
            {
              name: game.players.second.name,
              move: game.players.second.hand_move
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

class Api::V1::GamesController < ApplicationController
  def index
    @games = Game.order(created_at: :desc)
  end
#service Player initializer. on en crée 2 et un par defaut est le bot
  def create
    game_summary = PlayRockPaperScissors.new({ #si nom pas bon
      name: params[:name],
      move: params[:move]
    }).perform
# if round_success?
      # p 'i'* 60
      # p game_summary[:winner]
      # p 'i'* 60
    game = Game.new
    game.players << game_summary[:players]
    game.winner = game_summary[:winner]
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
    end
  end
end

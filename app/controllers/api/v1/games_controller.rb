class Api::V1::GamesController < ApplicationController
  def index
    @games = Game.order(created_at: :desc)

    render 'index.json', status: :ok
  end

  def create
    initialized_player = PlayerInitializer.new(params).perform
    if initialized_player[:errors].any?
      render json: initialized_player[:errors], status: :unprocessable_entity
    else
      @game = Game.new
      game_result = PlayRockPaperScissors.new(initialized_player[:player]).perform
      @game.players << [game_result[:players][:player], game_result[:players][:bot]]
      @game.winner = game_result[:winner]

      if @game.save
        render 'create.json', status: :created
      else
        render json: @game.errors, status: :unprocessable_entity
      end
    end
  end

end

class Api::V1::GamesController < ApplicationController
  MAX_PAGINATION_LIMIT = 100

  def index
    @games = Game.order(created_at: :desc).limit(limit).offset(params[:offset])

    render :index, status: :ok
  end

  def create
    initialized_player = PlayerInitializer.new(user_params).perform
    if initialized_player[:errors].any?
      render json: initialized_player[:errors], status: :unprocessable_entity
    else
      @game = Game.new
      game_result = PlayRockPaperScissors.new(initialized_player[:player]).perform
      @game.players << [game_result[:players][:player], game_result[:players][:bot]]
      @game.winner = game_result[:winner]

      if @game.save
        render :create, status: :created
      else
        render json: @game.errors, status: :unprocessable_entity
      end
    end
  end

  private

  def user_params
    params.permit(:name, :move)
  end

  def limit
    [
      params.fetch(:limit, MAX_PAGINATION_LIMIT).to_i,
      MAX_PAGINATION_LIMIT
    ].min
  end
end

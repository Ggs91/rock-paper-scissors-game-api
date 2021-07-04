class Api::V1::GamesController < ApplicationController
  MAX_PAGINATION_LIMIT = 100

  def index
    @games = Game.order(created_at: :desc).limit(limit).offset(params[:offset])

    render :index, status: :ok
  end

  def create
    @game = Game.new
    @game.players.build(player_params)
    @game.players << Player.new.bot

    if @game.save
      PlayRockPaperScissors.new(@game).perform
    else
      render json: @game.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def player_params
    params.permit(:name, :move)
  end

  def limit
    [
      params.fetch(:limit, MAX_PAGINATION_LIMIT).to_i,
      MAX_PAGINATION_LIMIT
    ].min
  end
end

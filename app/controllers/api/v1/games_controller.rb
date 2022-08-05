# frozen_string_literal: true

class Api::V1::GamesController < ApplicationController
  MAX_PAGINATION_LIMIT = 100

  def index
    @games = Game.order(created_at: :desc).limit(limit).offset(params[:offset])
  end

  def create
    @game = GameInitializer.new(game_params).perform

    if @game.save
      PlayRockPaperScissors.new(@game).perform
    else
      render json: @game.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def game_params
    params.permit(:name, :move)
  end

  def limit
    [
      params.fetch(:limit, MAX_PAGINATION_LIMIT).to_i,
      MAX_PAGINATION_LIMIT
    ].min
  end
end

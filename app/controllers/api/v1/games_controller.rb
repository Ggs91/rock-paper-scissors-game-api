module Api
  module v1
    class GamesController < ApplicationController
      def index
        @games = Game.order(created_at: :desc)
      end

      def create

      end
    end
  end
end

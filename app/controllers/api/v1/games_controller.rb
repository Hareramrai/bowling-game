# frozen_string_literal: true

class Api::V1::GamesController < ApplicationController
  # POST /games
  def create
    result = StartGame.call(game: Game.new(game_params))

    if result.success?
      render json: result.game, status: :created
    else
      render json: result.errors, status: :unprocessable_entity
    end
  end

  private

    def game_params
      params.require(:game).permit(:player_name)
    end
end

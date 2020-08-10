# frozen_string_literal: true

class Api::V1::PinsDownsController < ApplicationController
  before_action :set_game

  # POST /pins_downs
  def create
    result = AddPinsKnockedDown.call(game: @game, pins: pins)

    if result.success?
      render head: :ok
    else
      render json: result.errors, status: :unprocessable_entity
    end
  end

  private

    def set_game
      @game = Game.find params[:game_id]
    end

    def pins_down_params
      params.require(:pins_down).permit(:pins_knocked)
    end

    def pins
      pins_down_params[:pins_knocked]
    end
end

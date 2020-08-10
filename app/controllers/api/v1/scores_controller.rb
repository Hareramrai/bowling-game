# frozen_string_literal: true

class Api::V1::ScoresController < ApplicationController
  before_action :set_game

  def index
    render json: @game.as_json(only: [:scores_in_frames], methods: :total_scores)
  end

  private

    def set_game
      @game = Game.find params[:game_id]
    end
end

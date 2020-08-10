# frozen_string_literal: true

class UpdateGameScore < ApplicationInteractor
  delegate :game, to: :context
  delegate :pins_knock_down_in_throws, to: :game

  def call
    return unless game

    game.scores_in_frames = Games::CalculateScore.new(pins_knock_down_in_throws).scores
    game.save!
  end
end

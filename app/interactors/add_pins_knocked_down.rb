# frozen_string_literal: true

class AddPinsKnockedDown < ApplicationInteractor
  delegate :game, :pins, to: :context

  def call
    game.pins_knock_down_in_throws << pins
    game.save!

    UpdateGameScore.call(game: game)
  rescue ActiveRecord::RecordInvalid
    context.fail!(errors: game.errors)
  end
end

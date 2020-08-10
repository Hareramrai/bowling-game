# frozen_string_literal: true

class StartGame < ApplicationInteractor
  delegate :game, to: :context

  def call
    game.save!
  rescue ActiveRecord::RecordInvalid
    context.fail!(errors: game.errors)
  end
end

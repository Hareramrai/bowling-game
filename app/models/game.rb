# frozen_string_literal: true

class Game < ApplicationRecord
  validates :player_name, presence: true
  validates :pins_knock_down_in_throws, length: {
    maximum: 21,
    message: "Not allowed to throw more than 21 times.",
  }

  def total_scores
    scores_in_frames.compact.sum
  end
end

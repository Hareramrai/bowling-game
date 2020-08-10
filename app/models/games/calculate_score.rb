# frozen_string_literal: true

class Games::CalculateScore
  NUMBER_OF_FRAME = 10

  def initialize(pins_knock_down_in_throws)
    @pins_down_in_throws = pins_knock_down_in_throws
    @frames_scores = []
  end

  def scores
    current_throws = 0
    NUMBER_OF_FRAME.times do |frame_nummber|
      @frames_scores[frame_nummber], next_throws = Games::FrameScore.find_scores(
        pins_down_in_throws, current_throws
      )
      current_throws = next_throws
    end

    @frames_scores
  end

  private

    attr_reader :pins_down_in_throws
end

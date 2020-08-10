# frozen_string_literal: true

class Games::FrameScore
  PINS = 10

  class << self
    def find_scores(frames, frame_number)
      frame_score = 0

      if strike?(frames, frame_number)
        frame_score = score(frames, frame_number, 3)
        frame_number += 1
      elsif spare?(frames, frame_number)
        frame_score = score(frames, frame_number, 3)
        frame_number += 2
      else
        frame_score = score(frames, frame_number, 2)
        frame_number += 2
      end
      [frame_score, frame_number]
    end

    private

      def strike?(frames, frame_number)
        frames[frame_number].presence == PINS
      end

      def spare?(frames, frame_number)
        frames[frame_number, 2]&.sum == PINS
      end

      def score(frames, index, number_of_elements)
        frames[index, number_of_elements]&.sum
      end
  end
end

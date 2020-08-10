# frozen_string_literal: true

require "rails_helper"

RSpec.describe Games::CalculateScore, type: :model do
  let(:pins_down_in_throws) { [] }

  subject { described_class.new(pins_down_in_throws) }

  describe "#scores" do
    context "when no pins down in all throws" do
      let(:pins_down_in_throws) { Array.new(20, 0) }

      it "has 0 scores for each of the frame" do
        expect(subject.scores).to eq(Array.new(10, 0))
      end
    end

    context "when perfect game happened" do
      let(:pins_down_in_throws) { Array.new(12, 10) }

      it "has 30 scores for each of the frame" do
        expect(subject.scores).to eq(Array.new(10, 30))
      end
    end

    context "when only 1 pins down in all throws" do
      let(:pins_down_in_throws) { Array.new(20, 1) }

      it "has 2 scores for each of the frame" do
        expect(subject.scores).to eq(Array.new(10, 2))
      end
    end

    context "when spare happened in all frames" do
      let(:pins_down_in_throws) { Array.new(21, 5) }

      it "has 15 scores for each of the frame" do
        expect(subject.scores).to eq(Array.new(10, 15))
      end
    end
  end
end

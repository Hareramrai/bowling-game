# frozen_string_literal: true

require "rails_helper"

RSpec.describe Games::FrameScore, type: :model do
  let(:frame_number) { 0 }

  subject { described_class.find_scores(frames, frame_number) }

  describe ".find_scores" do
    context "when strike happened" do
      let(:frames) { [10, 5, 4, 10] }

      it "returns the sum of stike plus two next throws" do
        expect(subject.first).to eq(19)
      end

      it "moves the next_throws by 1" do
        expect(subject.last).to eq(1)
      end
    end

    context "when spare happened" do
      let(:frames) { [5, 5, 4, 10] }

      it "returns the sum of spare plus a next throw" do
        expect(subject.first).to eq(14)
      end

      it "moves the next_throws by 2" do
        expect(subject.last).to eq(2)
      end
    end

    context "when normal happened" do
      let(:frames) { [4, 5, 4, 10] }

      it "returns the sum of current frame(which is two throws only)" do
        expect(subject.first).to eq(9)
      end

      it "moves the next_throws by 2" do
        expect(subject.last).to eq(2)
      end
    end
  end
end

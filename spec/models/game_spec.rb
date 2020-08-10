# frozen_string_literal: true

require "rails_helper"

RSpec.describe Game, type: :model do
  context "validations" do
    it { should validate_presence_of(:player_name) }

    it { should allow_value(Array.new(21, 1)).for(:pins_knock_down_in_throws) }
    it { should_not allow_value(Array.new(22, 1)).for(:pins_knock_down_in_throws) }
  end

  describe "#total_scores" do
    let(:perfect_game) { create(:game, :all_throws_with_ten) }

    it "perfect game total_scores would be 300" do
      UpdateGameScore.call(game: perfect_game)

      expect(perfect_game.total_scores).to eq(300)
    end
  end
end

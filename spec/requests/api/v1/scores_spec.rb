# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Api::V1::ScoresController", type: :request do
  describe "GET /api/v1/games/:game_id/scores" do
    before do
      UpdateGameScore.call(game: game)
      get api_v1_game_scores_url(game_id: game_id)
    end

    context "when game exists" do
      let(:game) { create(:game, :all_throws_with_ten) }
      let(:game_id) { game.id }

      it "returns the scores of the game" do
        expect(response).to have_http_status(200)
        expect(json_response(response)).to include(scores_in_frames: Array.new(10, 30), total_scores: 300)
      end
    end

    context "when game does not exist" do
      let(:game) { }
      let(:game_id) { 9999 }

      it "raises NotFound exception" do
        expect(response).to have_http_status(404)
        expect(response.body).to include("Couldn't find Game with")
      end
    end
  end
end

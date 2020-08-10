# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Api::V1::GamesController", type: :request do
  describe "POST /api/v1/games" do
    before do
      post api_v1_games_url, params: params
    end

    context "when passed valid params" do
      let(:params) { { game: { player_name: "James" } } }

      it "create a new game with params" do
        expect(response).to have_http_status(201)
        expect(json_response(response)).to include(player_name: "James")
      end
    end

    context "when passed invalid params" do
      let(:ram) { create(:employee, :game) }

      let(:params) { { game: { player_name: nil } } }

      it "returns validation errors" do
        expect(response).to have_http_status(422)
        expect(response.body).to include("can't be blank")
      end
    end
  end
end

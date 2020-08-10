# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Api::V1::PinsDonwsController", type: :request do
  describe "POST /api/v1/pins_downs" do
    before do
      post api_v1_game_pins_downs_url(game), params: params
    end

    let(:params) { { pins_down: { pins_knocked: 5 } } }

    context "when passed valid params" do
      let(:game) { create(:game) }

      it "save the pins knocked and update the scores" do
        expect(response).to have_http_status(200)

        game.reload

        expect(game.pins_knock_down_in_throws).to eq([5])
        expect(game.scores_in_frames.first).to eq(5)
      end
    end

    context "when throws exceed the limit" do
      let(:game) { create(:game, :all_throws_with_five) }

      it "returns validation errors" do
        expect(response).to have_http_status(422)
        expect(response.body).to include("Not allowed to throw more than 21 times")
      end
    end
  end
end

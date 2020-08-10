# frozen_string_literal: true

FactoryBot.define do
  factory :game do
    sequence(:player_name) { |n| "name #{n}" }

    trait :all_throws_with_five do
      pins_knock_down_in_throws { Array.new(21, 5) }
    end

    trait :all_throws_with_ten do
      pins_knock_down_in_throws { Array.new(12, 10) }
    end
  end
end

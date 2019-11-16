# frozen_string_literal: true

FactoryBot.define do
  factory :board do
    name { 'Factory Board' }
  end

  factory :random_board, class: Board do
    name { Faker::FunnyName.three_word_name }
  end
end

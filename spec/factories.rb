# frozen_string_literal: true

FactoryBot.define do
  factory :step do
    name { 'To Do' }
    board { create(:random_board) }
  end

  factory :random_step do
    name { Faker::FunnyName.two_word_name }
    board { create(:random_board) }
  end

  factory :board do
    name { 'Factory Board' }
  end

  factory :random_board, class: Board do
    name { Faker::FunnyName.three_word_name }
  end
end

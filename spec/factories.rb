# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    content { 'Task 1' }
    step { create(:random_step) }
  end

  factory :random_task, class: Task do
    content { Faker::Educator.course_name }
    step { create(:random_step) }
  end

  factory :step do
    name { 'To Do' }
    board { create(:random_board) }
  end

  factory :random_step, class: Step do
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

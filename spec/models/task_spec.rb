# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task, type: :model do
  before(:all) do
    @task = create(:random_task)
  end

  it 'is valid with valid attributes' do
    expect(@task).to be_valid
  end

  it 'is not valid without content' do
    task1 = build(:random_task, content: nil)
    expect(task1).to_not be_valid
  end

  it 'is not valid without a step' do
    task2 = build(:random_task, step: nil)
    expect(task2).to_not be_valid
  end
end

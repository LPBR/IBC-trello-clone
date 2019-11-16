require 'rails_helper'

RSpec.describe Step, type: :model do
  before(:all) do
    @step = create(:step)
  end

  it 'is valid with valid attributes' do
    expect(@step).to be_valid
  end

  it 'is not valid without a name' do
    step1 = build(:step, name: nil)
    expect(step1).to_not be_valid
  end

  it 'is not valid without a board' do
    step2 = build(:step, board: nil)
    expect(step2).to_not be_valid
  end
end

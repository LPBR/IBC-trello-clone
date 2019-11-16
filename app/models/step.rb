# frozen_string_literal: true

# Step Class Model
class Step < ApplicationRecord
  belongs_to :board

  validates :name, presence: true
  validates :board, presence: true
end

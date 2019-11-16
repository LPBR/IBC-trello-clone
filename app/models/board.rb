# frozen_string_literal: true

# Board Class Model
class Board < ApplicationRecord
  has_many :steps, dependent: :destroy

  validates :name, presence: true
end

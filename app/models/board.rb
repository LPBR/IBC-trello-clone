# frozen_string_literal: true

# Board Class Model
class Board < ApplicationRecord
  has_many :steps

  validates :name, presence: true
end

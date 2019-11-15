# frozen_string_literal: true

# Board Class Model
class Board < ApplicationRecord
  validates :name, presence: true
end

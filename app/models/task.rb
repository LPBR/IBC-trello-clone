# frozen_string_literal: true

#  Task Class Model
class Task < ApplicationRecord
  belongs_to :step

  validates :content, presence: true
  validates :step, presence: true
end

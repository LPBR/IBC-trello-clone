# frozen_string_literal: true

# Step Class Model
class Step < ApplicationRecord
  belongs_to :board
  has_many :tasks, dependent: :destroy

  before_create :set_initial_step_position

  validates :name, presence: true
  validates :board, presence: true

  private

  def set_initial_step_position
    last_step = Step.where(board_id: board_id).order(:position).last
    self.position = 0 if last_step.nil?
    self.position = last_step.position + 1 unless last_step.nil?
  end
end

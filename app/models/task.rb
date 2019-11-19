# frozen_string_literal: true

#  Task Class Model
class Task < ApplicationRecord
  belongs_to :step

  before_create :set_initial_task_position

  validates :content, presence: true
  validates :step, presence: true

  private

  def set_initial_task_position
    last_task = step.tasks.order(:position).last
    self.position = 0 if last_task.nil?
    self.position = last_task.position + 1 unless last_task.nil?
  end
end

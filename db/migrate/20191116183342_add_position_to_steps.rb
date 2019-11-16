# frozen_string_literal: true

# Migration responsable for adding position to steps table
class AddPositionToSteps < ActiveRecord::Migration[5.2]
  def change
    add_column :steps, :position, :integer
  end
end

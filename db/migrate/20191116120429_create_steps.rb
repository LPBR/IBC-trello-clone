# frozen_string_literal: true

# Migration responsable for creating the steps table
class CreateSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :steps do |t|
      t.string :name, null: false
      t.references :board
      t.timestamps
    end
  end
end

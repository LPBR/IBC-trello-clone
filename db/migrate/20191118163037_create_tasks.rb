# frozen_string_literal: true

# Migration responsable for creating the tasks table
class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :content, null: false
      t.integer :position
      t.references :step, foreign_key: { on_delete: :cascade }
      t.timestamps
    end
  end
end

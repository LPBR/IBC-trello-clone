# frozen_string_literal: true

# Migration responsable for creating the boards table
class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end

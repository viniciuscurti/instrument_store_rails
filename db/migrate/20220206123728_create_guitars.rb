# frozen_string_literal: true

class CreateGuitars < ActiveRecord::Migration[7.0]
  def change
    create_table :guitars do |t|
      t.text :model
      t.integer :year
      t.boolean :is_available, default: true, null: false

      t.timestamps
    end
  end
end

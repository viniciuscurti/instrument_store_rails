class AddStolenToGuitar < ActiveRecord::Migration[7.0]
  def change
    add_column :guitars, :stolen, :boolean
  end
end

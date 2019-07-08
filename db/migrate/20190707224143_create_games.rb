class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :table
      t.integer :p1
      t.integer :p2
      t.integer :turn
      t.boolean :finished
      t.integer :winner
      t.string :title

      t.timestamps
    end
  end

  def change
    add_column :games, :turn, :integer
    add_column :games, :finished, :boolean
    add_column :games, :winner, :integer
  end
end

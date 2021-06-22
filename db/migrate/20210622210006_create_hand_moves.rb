class CreateHandMoves < ActiveRecord::Migration[5.2]
  def change
    create_table :hand_moves do |t|
      t.string :name

      t.timestamps
    end
  end
end

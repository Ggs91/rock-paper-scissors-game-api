class CreateHandMoves < ActiveRecord::Migration[5.2]
  def change
    create_table :hand_moves do |t|
      t.string :name, null: false
      t.references :player, foreign_key: true, index: true

      t.timestamps
    end
  end
end

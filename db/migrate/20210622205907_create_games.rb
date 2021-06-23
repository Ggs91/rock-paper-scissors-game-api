class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :winner, null: false

      t.timestamps
    end
  end
end

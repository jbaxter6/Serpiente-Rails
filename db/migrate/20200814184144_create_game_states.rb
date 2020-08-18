class CreateGameStates < ActiveRecord::Migration[6.0]
  def change
    create_table :game_states do |t|
      t.references :user
      t.integer :score
      t.string :save_name
      t.string :direction
      t.string :apple

      t.timestamps
    end
  end
end

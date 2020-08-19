class CreateRecord < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.references :user
      t.integer :score
      t.time :time
      t.timestamps
    end
  end
end

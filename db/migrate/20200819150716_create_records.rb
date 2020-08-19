class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :api_v1_records do |t|
      t.integer :score
      t.integer :time
      t.timestamps
      t.references :user
    end
  end
end

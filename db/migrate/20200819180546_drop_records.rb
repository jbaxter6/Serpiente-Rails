class DropRecords < ActiveRecord::Migration[6.0]
  def change
    drop_table :api_v1_records
  end
end

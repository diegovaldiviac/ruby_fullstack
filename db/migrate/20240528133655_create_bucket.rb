class CreateBucket < ActiveRecord::Migration[6.1]
  def change
    create_table :buckets do |t|
      t.string :name, null: false
      t.string :image
      t.string :type, null: false
      t.timestamps
    end
  end
end

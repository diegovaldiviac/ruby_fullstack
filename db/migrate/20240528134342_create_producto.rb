class CreateProducto < ActiveRecord::Migration[6.1]
  def change
    create_table :productos do |t|
      t.string :name, null: false
      t.float :price, null: false
      t.integer :status, default: 0
      t.references :bucket, foreign_key: true
      t.timestamps
    end
  end
end

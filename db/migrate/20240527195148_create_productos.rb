class CreateProductos < ActiveRecord::Migration[6.1]
  def change
    create_table :productos do |t|
      t.string :name
      t.string :type
      t.string :image
      t.timestamps
    end
  end
end
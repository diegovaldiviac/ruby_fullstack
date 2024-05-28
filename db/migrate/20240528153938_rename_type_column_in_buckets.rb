class RenameTypeColumnInBuckets < ActiveRecord::Migration[6.1]
  def change
    rename_column :buckets, :type, :category
  end
end

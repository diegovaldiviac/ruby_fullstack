class Producto < ApplicationRecord

    belongs_to :bucket, foreign_key: 'bucket_id'
end

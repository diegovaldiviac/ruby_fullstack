require 'rails_helper'

RSpec.describe Producto, type: :model do


  before do
    @bucket = Bucket.create(name: "bucket", category: "test")
    @producto = Producto.create(
      name: "test",
      price: 20,
      status: 0,
      bucket_id: @bucket.id
    )
  end

  context 'validations' do
    it "ensures the presence of name" do
      pet = Producto.new(name: "", price: 0, bucket_id: @bucket.id).save
      expect(pet).to eq(false)
    end
  end

  context "CRUD operations" do
    it "creates a producto and bucket" do
      expect(@producto).to be_valid
      expect {
        Producto.create(name: "test2", price: 2, bucket_id: @bucket.id)
      }.to change(Producto, :count).by(1)
    end
  
    it "reads a producto" do
      expect(Producto.find(@producto.id)).to eq(@producto)
    end
    
    it "updates a producto" do
      @producto.update(name: "New Name")
      expect(@producto.reload.name).to eq("New Name")
    end
    
    it "deletes a producto" do
      expect {
        @producto.destroy
      }.to change(Producto, :count).by(-1)
    end
  end
end

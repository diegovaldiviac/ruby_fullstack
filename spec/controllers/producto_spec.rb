
require 'rails_helper'

RSpec.describe ProductosController, type: :controller do
  let(:user) { create(:user) }
  let(:bucket) { create(:bucket) }
  let(:producto) { create(:producto, bucket: bucket) }

  before do
    sign_in user
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: { bucket_id: bucket.id }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Producto" do
        expect {
          post :create, params: { bucket_id: bucket.id, producto: attributes_for(:producto) }
        }.to change(Producto, :count).by(1)
      end

      it "redirects to the created producto" do
        post :create, params: { bucket_id: bucket.id, producto: attributes_for(:producto) }
        expect(response).to redirect_to(productos_bucket_path(bucket))
      end
    end

    context "with invalid params" do
      it "renders new template" do
        post :create, params: { bucket_id: bucket.id, producto: { name: nil } }
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      get :edit, params: { bucket_id: bucket.id, id: producto.id }
      expect(response).to be_successful
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      it "updates the requested producto" do
        put :update, params: { bucket_id: bucket.id, id: producto.id, producto: { name: "New Name" } }
        producto.reload
        expect(producto.name).to eq("New Name")
      end

      it "redirects to the producto" do
        put :update, params: { bucket_id: bucket.id, id: producto.id, producto: { name: "New Name" } }
        expect(response).to redirect_to(productos_bucket_path(bucket))
      end
    end

    context "with invalid params" do
      it "renders edit template" do
        put :update, params: { bucket_id: bucket.id, id: producto.id, producto: { name: nil } }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested producto" do
      producto # create the producto
      expect {
        delete :destroy, params: { bucket_id: bucket.id, id: producto.id }
      }.to change(Producto, :count).by(-1)
    end

    it "redirects to the productos list" do
      delete :destroy, params: { bucket_id: bucket.id, id: producto.id }
      expect(response).to redirect_to(productos_bucket_path(bucket))
    end
  end
end
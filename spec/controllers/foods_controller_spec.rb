require 'rails_helper'

RSpec.describe FoodsController, type: :controller do
  let(:user) { create(:user) }

  describe "#index" do
    it "assigns all foods to @foods" do
      food1 = create(:food, user: user)
      food2 = create(:food, user: user)
      get :index
      expect(assigns(:foods)).to eq([food2, food1])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "#new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "#create" do
    context "with valid parameters" do
      it "creates a new food item and redirects to root path" do
        sign_in user
        post :create, params: { food: { name: 'Pizza', measurement_unit: 'slice', price: 10, quantity: 8 } }
        expect(response).to redirect_to(root_path)
        expect(flash[:notice]).to eq('New food created successfully!')
      end
    end

    context "with invalid parameters" do
      it "does not create a new food item and renders new template" do
        sign_in user
        post :create, params: { food: { name: '', measurement_unit: 'slice', price: 10, quantity: 8 } }
        expect(response).to render_template(:new)
        expect(flash[:alert]).to eq('Failed to add a new food!')
      end
    end
  end

  describe "#destroy" do
    it "deletes the selected food item and redirects back to previous page" do
      sign_in user
      food = create(:food, user: user)
      expect {
        delete :destroy, params: { id: food.id }
      }.to change(Food, :count).by(-1)
      expect(response).to redirect_to(request.referer)
      expect(flash[:notice]).to eq('Successfully deleted')
    end

    it "does not delete the food item and displays a failure flash message" do
      sign_in user
      food = create(:food, user: user)
      allow(Food).to receive(:find).and_return(food)
      allow(food).to receive(:destroy).and_return(false)
      delete :destroy, params: { id: food.id }
      expect(response).to redirect_to(request.referer)
      expect(flash[:notice]).to eq('Failed to delete')
    end
  end
end
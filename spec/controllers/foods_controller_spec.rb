require 'rails_helper'

RSpec.describe FoodsController, type: :controller do
  describe '#index' do
    it 'assigns @foods' do
      food1 = create(:food)
      food2 = create(:food)
      get :index
      expect(assigns(:foods)).to eq([food1, food2])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe '#new' do
    it 'assigns a new food to @food' do
      get :new
      expect(assigns(:food)).to be_a_new(Food)
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe '#create' do
    context 'with valid parameters' do
      it 'creates a new food' do
        expect do
          post :create, params: { food: attributes_for(:food) }
        end.to change(Food, :count).by(1)
      end

      it 'redirects to the index page' do
        post :create, params: { food: attributes_for(:food) }
        expect(response).to redirect_to(foods_path)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new food' do
        expect do
          post :create, params: { food: attributes_for(:food, name: nil) }
        end.not_to change(Food, :count)
      end

      it 'redirects to the new page' do
        post :create, params: { food: attributes_for(:food, name: nil) }
        expect(response).to redirect_to(new_food_path)
      end
    end
  end

  describe '#destroy' do
    it 'destroys the food' do
      food = create(:food)
      expect do
        delete :destroy, params: { id: food.id }
      end.to change(Food, :count).by(-1)
    end

    it 'redirects to the index page' do
      food = create(:food)
      delete :destroy, params: { id: food.id }
      expect(response).to redirect_to(foods_path)
    end
  end
end

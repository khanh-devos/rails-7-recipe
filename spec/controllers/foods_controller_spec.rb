require 'rails_helper'

RSpec.describe FoodsController, type: :controller do
  describe 'GET #index' do
    it 'assigns all food items to @foods' do
      food1 = Food.create(name: 'Pizza', measurement_unit: 'pieces', price: 10, quantity: 5)
      food2 = Food.create(name: 'Burger', measurement_unit: 'pieces', price: 5, quantity: 2)

      get :index

      expect(assigns(:foods)).to eq([food2, food1])
    end

    it 'renders the index template' do
      get :index

      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new' do
    it 'renders the new template' do
      get :new

      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      before do
        @user = User.create
        allow(controller).to receive(:current_user).and_return(@user)
      end

      it 'creates a new food item' do
        expect do
          post :create, params: { food: { name: 'Pizza', measurement_unit: 'pieces', price: 10, quantity: 5 } }
        end.to change(Food, :count).by(1)
      end

      it 'assigns the current user as the buyer_id for the new food item' do
        post :create, params: { food: { name: 'Pizza', measurement_unit: 'pieces', price: 10, quantity: 5 } }

        expect(Food.last.buyer_id).to eq(@user.id)
      end

      it 'redirects to the homepage' do
        post :create, params: { food: { name: 'Pizza', measurement_unit: 'pieces', price: 10, quantity: 5 } }

        expect(response).to redirect_to('/')
      end

      it 'sets the flash notice message' do
        post :create, params: { food: { name: 'Pizza', measurement_unit: 'pieces', price: 10, quantity: 5 } }

        expect(flash[:notice]).to eq('New food created successfully!')
      end
    end

    context 'with invalid parameters' do
      it 'renders the new template' do
        post :create, params: { food: { name: 'Pizza', measurement_unit: 'pieces', price: -10, quantity: 5 } }

        expect(response).to render_template(:new)
      end

      it 'sets the flash alert message' do
        post :create, params: { food: { name: 'Pizza', measurement_unit: 'pieces', price: -10, quantity: 5 } }

        expect(flash[:alert]).to eq('Failed to add a new food!')
      end
    end
  end
  describe 'DELETE #destroy' do
    it 'destroys the selected food item' do
      food = Food.create(name: 'Pizza', measurement_unit: 'pieces', price: 10, quantity: 5)

      expect do
        delete :destroy, params: { id: food.id }
      end.to change(Food, :count).by(-1)
    end

    it 'redirects back to the previous page' do
      request.env['HTTP_REFERER'] = '/foods'
      food = Food.create(name: 'Pizza', measurement_unit: 'pieces', price: 10, quantity: 5)

      delete :destroy, params: { id: food.id }

      expect(response).to redirect_to('/foods')
    end

    it 'sets the flash notice message on successful deletion' do
      food = Food.create(name: 'Pizza', measurement_unit: 'pieces', price: 10, quantity: 5)

      delete :destroy, params: { id: food.id }

      expect(flash[:notice]).to eq('Successfully deleted')
    end
  end
end

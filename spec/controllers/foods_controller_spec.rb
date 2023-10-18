RSpec.describe FoodsController, type: :controller do
    let(:user) { create(:user) }
    let(:food) { create(:food, buyer_id: user.id) }
  
    describe "POST #create" do
      context "with valid parameters" do
        it "creates a new food" do
          expect {
            post :create, params: { food: attributes_for(:food) }, session: { user_id: user.id }
          }.to change(Food, :count).by(1)
        end
  
        it "redirects to root path" do
          post :create, params: { food: attributes_for(:food) }, session: { user_id: user.id }
          expect(response).to redirect_to(root_path)
        end
      end
  
      context "with invalid parameters" do
        it "does not create a new food" do
          expect {
            post :create, params: { food: attributes_for(:food, name: nil) }, session: { user_id: user.id }
          }.not_to change(Food, :count)
        end
  
        it "renders the new template" do
          post :create, params: { food: attributes_for(:food, name: nil) }, session: { user_id: user.id }
          expect(response).to render_template(:new)
        end
  
        it "sets the flash alert" do
          post :create, params: { food: attributes_for(:food, name: nil) }, session: { user_id: user.id }
          expect(flash[:alert]).to be_present
        end
      end
    end
  
    describe "DELETE #destroy" do
      it "destroys the food" do
        expect {
          delete :destroy, params: { id: food.id }, session: { user_id: user.id }
        }.to change(Food, :count).by(-1)
      end
  
      it "redirects back" do
        delete :destroy, params: { id: food.id }, session: { user_id: user.id }
        expect(response).to redirect_to(request.referer)
      end
  
      it "sets the flash notice" do
        delete :destroy, params: { id: food.id }, session: { user_id: user.id }
        expect(flash[:notice]).to be_present
      end
    end
  
    describe "GET #index" do
      it "renders the index template" do
        get :index
        expect(response).to render_template(:index)
      end
  
      it "assigns all foods ordered by created_at in descending order" do
        foods = create_list(:food, 3)
        get :index
        expect(assigns(:foods)).to eq(foods.reverse)
      end
    end
  end
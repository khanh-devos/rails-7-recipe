RSpec.describe "Foods", type: :request do
    let(:user) { create(:user) }
    let(:food) { create(:food, buyer_id: user.id) }
  
    describe "GET /foods" do
      it "returns status code 200" do
        get foods_path
        expect(response).to have_http_status(200)
      end
  
      it "returns all foods ordered by created_at in descending order" do
        foods = create_list(:food, 3)
        get foods_path
        expect(assigns(:foods)).to eq(foods.reverse)
      end
    end
  
    describe "POST /foods" do
      context "with valid parameters" do
        it "creates a new food" do
          expect {
            post foods_path, params: { food: attributes_for(:food) }, session: { user_id: user.id }
          }.to change(Food, :count).by(1)
        end
  
        it "redirects to root path" do
          post foods_path, params: { food: attributes_for(:food) }, session: { user_id: user.id }
          expect(response).to redirect_to(root_path)
        end
      end
  
      context "with invalid parameters" do
        it "does not create a new food" do
          expect {
            post foods_path, params: { food: attributes_for(:food, name: nil) }, session: { user_id: user.id }
          }.not_to change(Food, :count)
        end
  
        it "renders the new template" do
          post foods_path, params: { food: attributes_for(:food, name: nil) }, session: { user_id: user.id }
          expect(response).to render_template(:new)
        end
      end
    end
  
    describe "DELETE /foods/:id" do
      it "destroys the food" do
        expect {
          delete food_path(food), session: { user_id: user.id }
        }.to change(Food, :count).by(-1)
      end
  
      it "redirects back" do
        delete food_path(food), session: { user_id: user.id }
        expect(response).to redirect_to(request.referer)
      end
    end
  end
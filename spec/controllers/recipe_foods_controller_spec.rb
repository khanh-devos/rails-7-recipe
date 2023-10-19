# require 'rails_helper'

# RSpec.describe RecipeFoodsController, type: :controller do
#   let(:user) { create(:user) }
#   let(:recipe) { create(:recipe) }
#   let(:food) { create(:food) }
#   let(:recipe_food) { create(:recipe_food, recipe: recipe, food: food) }

#   before(:each) do
#     login_as(user)
#   end

#   describe 'GET #edit' do
#     it 'assigns the requested recipe food to @recipe_food' do
#       get :edit, params: { id: recipe_food.id }
#       expect(assigns(:recipe_food)).to eq(recipe_food)
#     end

#     it 'renders the edit template' do
#       get :edit, params: { id: recipe_food.id }
#       expect(response).to render_template(:edit)
#     end
#   end

#   describe 'PUT #update' do
#     it 'updates the recipe food attributes' do
#       new_quantity = 2
#       put :update, params: { id: recipe_food.id, recipe_food: { quantity: new_quantity } }
#       recipe_food.reload
#       expect(recipe_food.quantity).to eq(new_quantity)
#     end

#     it "redirects to the user's recipe path after successful update" do
#       put :update, params: { id: recipe_food.id, recipe_food: { quantity: 2 } }
#       expect(response).to redirect_to(user_recipe_path(user_id: user.id, id: recipe_food.recipe_id))
#     end

#     it 'renders the edit template with an alert message if update fails' do
#       put :update, params: { id: recipe_food.id, recipe_food: { quantity: nil } }
#       expect(response).to render_template(:edit)
#       expect(flash[:alert]).to be_present
#     end
#   end

#   describe 'GET #new' do
#     it 'assigns the requested recipe to @recipe' do
#       get :new, params: { recipe_id: recipe.id }
#       expect(assigns(:recipe)).to eq(recipe)
#     end

#     it 'gets all foods and stores their names and ids in @food_arr' do
#       food1 = create(:food, name: 'Food1')
#       food2 = create(:food, name: 'Food2')
#       get :new, params: { recipe_id: recipe.id }
#       expect(assigns(:food_arr)).to eq([[food1.name, food1.id], [food2.name, food2.id]])
#     end

#     it 'renders the new template' do
#       get :new, params: { recipe_id: recipe.id }
#       expect(response).to render_template(:new)
#     end
#   end

#   describe 'POST #create' do
#     it 'creates a new recipe food' do
#       expect do
#         post :create, params: { recipe_id: recipe.id, recipe_food: { quantity: 2, food_id: food.id } }
#       end.to change(RecipeFood, :count).by(1)
#     end

#     it 'sets the recipe_id based on the provided recipe_id parameter' do
#       post :create, params: { recipe_id: recipe.id, recipe_food: { quantity: 2, food_id: food.id } }
#       expect(RecipeFood.last.recipe_id).to eq(recipe.id)
#     end

#     it 'redirects to the root path after successful creation' do
#       post :create, params: { recipe_id: recipe.id, recipe_food: { quantity: 2, food_id: food.id } }
#       expect(response).to redirect_to(root_path)
#     end

#     it 'renders the new template with an alert message if creation fails' do
#       post :create, params: { recipe_id: recipe.id, recipe_food: { quantity: nil, food_id: food.id } }
#       expect(response).to render_template(:new)
#       expect(flash[:alert]).to be_present
#     end
#   end

#   describe 'DELETE #destroy' do
#     it 'deletes the specified recipe food' do
#       delete :destroy, params: { id: recipe_food.id }
#       expect(RecipeFood.exists?(recipe_food.id)).to be_falsey
#     end

#     it 'redirects back to the referring page after successful deletion' do
#       request.env['HTTP_REFERER'] = '/recipes'
#       delete :destroy, params: { id: recipe_food.id }
#       expect(response).to redirect_to('/recipes')
#     end

#     it 'sets an alert message if deletion fails' do
#       allow_any_instance_of(RecipeFood).to receive(:destroy).and_return(false)
#       delete :destroy, params: { id: recipe_food.id }
#       expect(flash[:alert]).to be_present
#     end
#   end
# end

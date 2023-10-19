# require 'rails_helper'

# RSpec.describe RecipesController, type: :controller do
#   let(:user) { create(:user) }
#   let!(:recipe) { create(:recipe, author_id: user.id) }

#   describe 'GET #index' do
#     it 'returns a success response' do
#       get :index
#       expect(response).to be_successful
#     end

#     it 'assigns all recipes to @recipes' do
#       get :index
#       expect(assigns(:recipes)).to eq([recipe])
#     end
#   end

#   describe 'GET #show' do
#     it 'returns a success response' do
#       get :show, params: { id: recipe.id }
#       expect(response).to be_successful
#     end

#     it 'assigns the requested recipe to @recipe' do
#       get :show, params: { id: recipe.id }
#       expect(assigns(:recipe)).to eq(recipe)
#     end

#     it 'assigns recipe foods to @recipe_foods' do
#       recipe_food = create(:recipe_food, recipe_id: recipe.id)
#       get :show, params: { id: recipe.id }
#       expect(assigns(:recipe_foods)).to eq([recipe_food])
#     end
#   end

#   describe 'POST #create' do
#     context 'with valid parameters' do
#       it 'creates a new recipe' do
#         expect do
#           post :create, params: { recipe: attributes_for(:recipe), user_id: user.id }
#         end.to change(Recipe, :count).by(1)
#       end

#       it 'sets the correct flash notice' do
#         post :create, params: { recipe: attributes_for(:recipe), user_id: user.id }
#         expect(flash[:notice]).to eq 'New recipe created successfully'
#       end

#       it 'redirects to the homepage' do
#         post :create, params: { recipe: attributes_for(:recipe), user_id: user.id }
#         expect(response).to redirect_to('/')
#       end
#     end

#     context 'with invalid parameters' do
#       it 'does not create a new recipe' do
#         expect do
#           post :create, params: { recipe: attributes_for(:recipe, name: ''), user_id: user.id }
#         end.to_not change(Recipe, :count)
#       end

#       it 'renders the new template again' do
#         post :create, params: { recipe: attributes_for(:recipe, name: ''), user_id: user.id }
#         expect(response).to render_template(:new)
#       end

#       it 'sets the correct alert message' do
#         post :create, params: { recipe: attributes_for(:recipe, name: ''), user_id: user.id }
#         expect(flash[:alert]).to eq 'Failed to create a new recipe'
#       end
#     end
#   end

#   describe 'PATCH #modify_public' do
#     it 'changes the public status of the recipe' do
#       expect do
#         patch :modify_public, params: { id: recipe.id }
#       end.to change { recipe.reload.public }.from(true).to(false)
#     end

#     it 'redirects back to the previous page' do
#       request.env['HTTP_REFERER'] = '/recipes'
#       patch :modify_public, params: { id: recipe.id }
#       expect(response).to redirect_to('/recipes')
#     end
#   end

#   describe 'DELETE #destroy' do
#     it 'destroys the recipe' do
#       expect do
#         delete :destroy, params: { id: recipe.id }
#       end.to change(Recipe, :count).by(-1)
#     end

#     it 'sets the correct flash notice' do
#       delete :destroy, params: { id: recipe.id }
#       expect(flash[:notice]).to eq 'Successfully deleted'
#     end

#     it 'redirects to the homepage' do
#       delete :destroy, params: { id: recipe.id }
#       expect(response).to redirect_to('/')
#     end
#   end
# end

require 'rails_helper'

RSpec.describe 'Public Recipes', type: :feature do
  let(:user) { User.create!(name: 'Sample User', email: 'gname@email.com', password: 'password') }

  context 'index' do
    before do
      @recipe = Recipe.create!(name: 'Recipe 1', description: 'Description 1', preparation_time: 0.5, public: true,
                               cooking_time: 1, user: user)

      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: 'password'
      click_on 'Log in'
    end

    it 'renders a list of recipes' do
      visit public_recipes_path(user_id: user.id)
      expect(page).to have_content(user.name)
      expect(page).to have_content(@recipe.name.upcase)
    end

    it 'check link to the recipe#show' do
      visit user_recipe_path(user_id: user.id, id: @recipe.id)
      expect(page).to have_link('Generate shopping list')
    end
  end
end

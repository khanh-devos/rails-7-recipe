require 'rails_helper'

RSpec.describe 'Home page', type: 'feature' do
  describe 'test user#show' do
    before :each do
      @user1 = User.create(name: 'user1', email: 'bio1@gmail.com', password: 'photo1@bc')
      @user2 = User.create(name: 'user2', email: 'bio2@gmail.com', password: 'photo2@bc')

      @food1 = Food.create(buyer_id: @user1.id, name: 'food1', measurement_unit: 'unit', price: 1, quantity: 2)
      @food2 = Food.create(buyer_id: @user1.id, name: 'food2', measurement_unit: 'unit', price: 1, quantity: 2)
      @food3 = Food.create(buyer_id: @user1.id, name: 'food3', measurement_unit: 'gram', price: 1, quantity: 1000)

      @recipe1 = Recipe.create(
        author_id: @user1.id,
        name: 'recipe1',
        public: true,
        cooking_time: 1,
        preparation_time: 1,
        description: 'This is a description1'
      )

      @recipe2 = Recipe.create(
        author_id: @user2.id,
        name: 'recipe2',
        public: true,
        cooking_time: 1,
        preparation_time: 1,
        description: 'This is a description2'
      )

      @recipe_food1 = RecipeFood.create(recipe_id: @recipe1.id, food_id: @food1.id, quantity: 1)
      @recipe_food2 = RecipeFood.create(recipe_id: @recipe1.id, food_id: @food2.id, quantity: 3)

      # First of all, log in
      visit '/users/sign_in'
      within('form') do
        fill_in 'Email', with: 'bio1@gmail.com'
        fill_in 'Password', with: 'photo1@bc'
      end

      click_on 'Log in'
      click_on 'Shopping list'
    end

    it 'show the title of the page' do
      expect(page).to have_content('SHOPPING LIST')
    end

    it "show 'Total items : 1'" do
      expect(page).to have_content('food2')
      expect(page).to have_content('Total items : 1')
    end
  end
end

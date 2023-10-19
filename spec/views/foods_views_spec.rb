require 'rails_helper'

RSpec.describe 'Food page', type: 'feature' do
  describe 'test foods#show' do
    before :each do
      @user1 = User.create(name: 'user1', email: 'bio1@gmail.com', password: 'photo1@bc')
      @user2 = User.create(name: 'user2', email: 'bio2@gmail.com', password: 'photo2@bc')

      @food1 = Food.create(buyer_id: @user1.id, name: 'food1', measurement_unit: 'unit', quantity: 2)
      @food2 = Food.create(buyer_id: @user1.id, name: 'food2', measurement_unit: 'unit', quantity: 2)
      @food3 = Food.create(buyer_id: @user1.id, name: 'food3', measurement_unit: 'gram', quantity: 1000)
      @food4 = Food.create(buyer_id: @user2.id, name: 'food4', measurement_unit: 'gram', quantity: 1000)

      @recipe1 = Recipe.create(author_id: @user1.id, name: 'recipe1', public: true, cooking_time: 1, preparation_time: 1,
                               description: 'This is a description1')

      @recipe2 = Recipe.create(author_id: @user2.id, name: 'recipe2', public: true, cooking_time: 1, preparation_time: 1,
                               description: 'This is a description2')

      @recipe_food1 = RecipeFood.create(recipe_id: @recipe1.id, food_id: @food1.id, quantity: 1)
      @recipe_food2 = RecipeFood.create(recipe_id: @recipe1.id, food_id: @food2.id, quantity: 3)

      # First of all, log in
      visit '/users/sign_in'
      within('form') do
        fill_in 'user_email', with: 'bio1@gmail.com'
        fill_in 'user_password', with: 'photo1@bc'
      end

      click_button 'Log in'

      # Check in Food page
      click_link 'Food'
    end

    it 'check all the food attributes names' do
      expect(page).to have_content('Food name')
      expect(page).to have_content('Unit')
      expect(page).to have_content('Unit price')
      expect(page).to have_content('Quantity')
    end

    it 'show all the THREE foods names of @user1 only' do
      expect(page).to have_content('FOOD1')
      expect(page).to have_content('FOOD2')
      expect(page).to have_content('FOOD3')
      expect(page).not_to have_content('FOOD4')
    end

    it 'show link-btn "Add new" ' do
      expect(page).to have_link('Add new')
    end

    it "show button 'destroy'" do
      expect(page).to have_button('destroy')
    end

    it 'if click on link-btn "Add new", redirect to foods#new with form' do
      click_link('Add new')
      expect(page).to have_content('NEW FOOD')
      expect(page).to have_selector('form', count: 1)
      expect(page).to have_selector('input[type="submit"]', count: 1)
    end

    it 'check button "destroy" works fine when delete a food' do
      expect(page).to have_content('FOOD1')
      first('button[type="submit"]').click
      expect(page).to have_content('Successfully deleted')
    end
  end
end

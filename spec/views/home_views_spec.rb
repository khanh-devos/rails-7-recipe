require 'rails_helper'

RSpec.describe 'Home page', type: 'feature' do
  describe 'test user#show' do
    before :each do
      @user1 = User.create(name: 'user1', email: 'bio1@gmail.com', password: 'photo1@bc')
      @user2 = User.create(name: 'user2', email: 'bio2@gmail.com', password: 'photo2@bc')

      @food1 = Food.create(buyer_id: @user1.id, name: 'food1', measurement_unit: 'unit', quantity: 2)
      @food2 = Food.create(buyer_id: @user1.id, name: 'food2', measurement_unit: 'unit', quantity: 2)
      @food3 = Food.create(buyer_id: @user1.id, name: 'food3', measurement_unit: 'gram', quantity: 1000)
      @food4 = Food.create(buyer_id: @user2.id, name: 'food4', measurement_unit: 'gram', quantity: 1000)

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
        fill_in 'user_email', with: 'bio1@gmail.com'
        fill_in 'user_password', with: 'photo1@bc'
      end

      click_button 'Log in'
    end

    it "check login user's name existing and link-btns 'Recipe', 'Log Out'" do
      expect(page).to have_content('user1')
      expect(page).to have_link('Log Out')
      expect(page).to have_link('Recipe')
    end

    it "check button 'Log Out' works fine" do
      click_link('Log Out')
      expect(page).to have_content('You need to sign in or sign up before continuing.')

      expect(page).to have_content('Log in')
      expect(page).not_to have_link('Recipe')
      expect(page).not_to have_content('user1')
    end

    it 'show recipe1 of login-user = user1, not recipe2 of user2' do
      expect(page).to have_content('RECIPE1')
      expect(page).not_to have_content('RECIPE2')
    end

    it 'show recipe1\'s description' do
      expect(page).to have_content('This is a description1')
    end

    it "show link-btn 'new recipe'" do
      expect(page).to have_link('New recipe')
    end

    it "show btn 'remove'" do
      expect(page).to have_button('remove')
    end

    it 'if click on link-btn "new recipe", redirect to recipe#new with form' do
      click_link('New recipe')
      expect(page).to have_content('RECIPE NEW')
      expect(page).to have_selector('form', count: 1)
      expect(page).to have_selector('input[type="submit"]', count: 1)
    end

    it 'check link "Home" works fine with recipe1 shown and recipe2 unshown' do
      click_link('Home')
      expect(page).to have_content('RECIPE1')
      expect(page).not_to have_content('RECIPE2')
    end

    it 'check button "remove" works fine when delete recipe1' do
      expect(page).to have_content('RECIPE1')
      click_button('remove')
      expect(page).not_to have_content('RECIPE1')
    end
  end
end

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

      
      @recipe1 = Recipe.create(author_id: @user1.id, name: 'recipe1', public: true, cooking_time: 1, preparation_time: 1,
        description: 'This is a description1')

      @recipe2 = Recipe.create(author_id: @user2.id, name: 'recipe2', public: true, cooking_time: 1, preparation_time: 1,
        description: 'This is a description2')

      @recipe_food1 = RecipeFood.create(recipe_id: @recipe1.id, food_id: @food1.id, quantity: 1)
      @recipe_food2 = RecipeFood.create(recipe_id: @recipe1.id, food_id: @food2.id, quantity: 3)

      
      # First of all, log in
      

    end


    it "check button 'Log In' failed with wrong email" do
      visit "/users/sign_in"
      within('form') do
        fill_in 'user_email', with: 'bioX@gmail.com'
        fill_in 'user_password', with: 'photo1@bc'
      end
      click_button 'Log in'
      
      expect(page).to have_content('Invalid Email or password.')
    end

    it "check button 'Log In' failed with wrong password" do
      visit "/users/sign_in"
      within('form') do
        fill_in 'user_email', with: 'bio1@gmail.com'
        fill_in 'user_password', with: 'photo1@bc123'
      end
      click_button 'Log in'
      
      expect(page).to have_content('Invalid Email or password.')
    end

    it "check button 'Log In' works fine" do
      visit "/users/sign_in"
      within('form') do
        fill_in 'user_email', with: 'bio1@gmail.com'
        fill_in 'user_password', with: 'photo1@bc'
      end
  
      click_button 'Log in'

      
      expect(page).to have_content('Signed in successfully.')
      expect(page).to have_content('user1')
    end

    it "check button 'Sign Up' failed with unmatching password" do
      visit "/users/sign_up"
      within('form') do
        fill_in 'user_name', with: 'bio1'
        fill_in 'user_email', with: 'bio1@gmail.com'
        fill_in 'user_password', with: 'photo1@bc'
        fill_in 'user_password_confirmation', with: 'photo1@bc123'
      end  
      click_button 'Sign up'
      expect(page).to have_content('Password confirmation doesn\'t match Password')
      
    end

    it "check button 'Sign Up' failed with existing email" do
      visit "/users/sign_up"
      within('form') do
        fill_in 'user_name', with: 'bio1'
        fill_in 'user_email', with: 'bio1@gmail.com'
        fill_in 'user_password', with: 'photo1@bc'
        fill_in 'user_password_confirmation', with: 'photo1@bc'
      end  
      click_button 'Sign up'
      expect(page).to have_content('Email has already been taken')
      
    end

    it "check button 'Sign Up' failed with empty name" do
      visit "/users/sign_up"
      within('form') do
        fill_in 'user_email', with: 'bio1@gmail.com'
        fill_in 'user_password', with: 'photo1@bc'
        fill_in 'user_password_confirmation', with: 'photo1@bc'
      end  
      click_button 'Sign up'
      expect(page).to have_content('Name can\'t be blank')
      
    end

    it "check button 'Sign Up' works fine" do
      visit "/users/sign_up"
      within('form') do
        fill_in 'user_name', with: 'bio1'
        fill_in 'user_email', with: 'bio3@gmail.com'
        fill_in 'user_password', with: 'photo1@bc'
        fill_in 'user_password_confirmation', with: 'photo1@bc'
      end  
      click_button 'Sign up'
      expect(page).to have_content('Welcome! You have signed up successfully.')
      
    end


  end
end

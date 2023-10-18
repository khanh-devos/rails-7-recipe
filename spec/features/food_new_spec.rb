require 'rails_helper'

RSpec.describe 'Food new' do
  before :each do
    @user = User.create(name: 'naruto', email: 'naruto@gmail.com') # Create and save a user to the database
    @food = Food.create(name: 'potato', measurement_unit: 'gram', price: 1, quantity: 1, user_id: @user.id)
    visit new_food_path
  end

  it 'see the title' do
    expect(page).to have_content('Add New Ingredient')
  end

  it 'see the add new ingredient link' do
    expect(page).to have_button('Add new Ingredient')
  end
end

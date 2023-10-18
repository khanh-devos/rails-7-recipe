require 'rails_helper'

RSpec.describe 'Foods index' do
  before :each do
    @user = User.create(name: 'naruto', email: 'naruto@gmail.com') # Create and save a user to the database
    @food = Food.create(name: 'potato', measurement_unit: 'gram', price: 1, quantity: 1, user_id: @user.id)
    visit foods_path
  end

  it 'sees the title' do
    expect(page).to have_content('My Ingredients')
  end

  it 'see the navbar ' do
    expect(page).to have_content('Public Recipes')
  end

  it 'see the add ingredient button ' do
    expect(page).to have_link('Add Ingredient')
  end

  it 'when I click on add ingredient it should lead to add ingredient page' do
    click_on 'Add Ingredient'
    expect(page).to have_content('Add New Ingredient')
  end
end

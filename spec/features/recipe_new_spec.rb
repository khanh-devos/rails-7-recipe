require 'rails_helper'

RSpec.describe 'Recipes new', type: :feature do
  before :each do
    login_user
  end

  it 'sees the title' do
    visit new_recipe_path # Visit the recipes_path after logging in
    expect(page).to have_content('My Recipe')
  end

  it 'sees the navbar' do
    visit new_recipe_path
    expect(page).to have_content('My Ingredients')
  end

  it 'sees the add new recipe link' do
    visit new_recipe_path
    expect(page).to have_button('Add new recipe')
  end

  it 'when click add recipe go to the add recipe page' do
    visit new_recipe_path
    expect(page).to have_content('New Recipe')
  end
end

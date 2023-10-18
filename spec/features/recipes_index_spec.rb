require 'rails_helper'

RSpec.describe 'Recipes index', type: :feature do
  before :each do
    login_user
  end

  it 'sees the title' do
    visit recipes_path # Visit the recipes_path after logging in
    expect(page).to have_content('My Recipe')
  end

  it 'sees the navbar' do
    visit recipes_path # Visit the recipes_path after logging in
    expect(page).to have_content('My Ingredients')
  end

  it 'sees the add new recipe link' do
    visit recipes_path # Visit the recipes_path after logging in
    expect(page).to have_link('Add Recipe')
  end

  it 'when click add recipe go to the add recipe page' do
    visit recipes_path
    click_on 'Add Recipe'
    expect(page).to have_content('New Recipe')
  end
end

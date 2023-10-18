require 'rails_helper'

RSpec.describe 'Recipes show', type: :feature do
  before :each do
    login_user
  end

  it 'sees the public toggle' do
    visit recipe_path(@recipe.id) # Visit the recipes_path after logging in
    expect(page).to have_content('Public')
  end

  it 'see the navbar' do
    visit recipe_path(@recipe.id)
    expect(page).to have_content('Shopping List')
  end

  it 'see the curry title' do
    visit recipe_path(@recipe.id)
    expect(page).to have_content(@recipe.name)
  end

  it 'see the add ingredient link' do
    visit recipe_path(@recipe.id)
    expect(page).to have_content('Add ingredient')
  end

  it 'see the generate shopping link' do
    visit recipe_path(@recipe.id)
    expect(page).to have_content('Generate shopping List')
  end

  it 'see the user name ' do
    visit recipe_path(@recipe.id)
    expect(page).to have_content(@user.name)
  end
end

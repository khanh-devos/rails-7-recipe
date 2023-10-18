require 'rails_helper'

RSpec.describe 'Public Recipes Index' do
  before :each do
    visit public_recipes_path
  end

  it 'see the title' do
    expect(page).to have_content('Recipe on Rails')
  end

  it 'see the navbar' do
    expect(page).to have_content('Public Recipes')
  end
end

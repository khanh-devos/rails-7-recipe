require 'rails_helper'

RSpec.feature 'Foods', type: :feature do
  let(:user) { create(:user) }

  scenario 'User creates a new food item' do
    sign_in user
    visit new_food_path
    fill_in 'Name', with: 'Pizza'
    fill_in 'Measurement Unit', with: 'slice'
    fill_in 'Price', with: '10'
    fill_in 'Quantity', with: '8'
    click_button 'Create Food'
    expect(page).to have_content('New food created successfully!')
    expect(current_path).to eq(root_path)
  end
end

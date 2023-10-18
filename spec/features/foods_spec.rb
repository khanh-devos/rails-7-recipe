require 'rails_helper'

RSpec.feature "Foods", type: :feature do
  scenario "Creating a new food" do
    visit new_food_path
    fill_in "Name", with: "Apple"
    fill_in "Measurement unit", with: "Piece"
    fill_in "Price", with: 1.99
    fill_in "Quantity", with: 10
    click_button "Create Food"

    expect(page).to have_text("Ingredient was successfully created")
    expect(page).to have_text("Apple")
  end

  scenario "Deleting a food" do
    food = create(:food)
    visit foods_path
    click_link "Delete"

    expect(page).to have_text("Food successfully deleted")
    expect(page).not_to have_text(food.name)
  end
end
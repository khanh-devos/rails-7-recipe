require 'rails_helper'

RSpec.describe RecipeFood do
  before(:all) do
    @user = User.create(name: 'Peter', email: 'peter@gmail.com')
    @food = Food.create(buyer_id: @user.id, name: 'food1', measurement_unit: 'unit', quantity: 2)

    @recipe = Recipe.create(author_id: @user.id, name: 'recipe1', public: true, cooking_time: 1, preparation_time: 1,
                            description: 'This is a description')

    @recipe_food = RecipeFood.create(recipe_id: @recipe.id, food_id: @food.id, quantity: 1000)
  end

  it 'quantity should be present' do
    @recipe_food.quantity = nil
    expect(@recipe_food).to_not be_valid
  end

  it 'quantity should not be negative' do
    @recipe_food.quantity = -1
    expect(@recipe_food).to_not be_valid
  end

  it 'quantity should be an integer' do
    @recipe_food.quantity = 'string'
    expect(@recipe_food).to_not be_valid
  end

  it 'should belong to @food' do
    assc = described_class.reflect_on_association(:food)
    expect(assc.macro).to eq :belongs_to
  end

  it 'should belong to @recipe' do
    assc = described_class.reflect_on_association(:recipe)
    expect(assc.macro).to eq :belongs_to
  end
end

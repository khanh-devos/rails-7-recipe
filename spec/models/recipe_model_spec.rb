require 'rails_helper'

RSpec.describe Recipe do
  before(:all) do
    @user = User.create(name: 'Peter', email: 'peter@gmail.com')
    @recipe = Recipe.create(author_id: @user.id, name: 'recipe1', public: true, cooking_time: 1, preparation_time: 1,
                            description: 'This is a description')
  end

  it 'name should be present' do
    @recipe.name = nil
    expect(@recipe).to_not be_valid
  end

  it 'name should not be too long' do
    @recipe.name = 'a' * 251
    expect(@recipe).to_not be_valid
  end

  it 'cooking_time should be present' do
    @recipe.cooking_time = nil
    expect(@recipe).to_not be_valid
  end

  it 'cooking_time should be an integer' do
    @recipe.cooking_time = 'string'
    expect(@recipe).to_not be_valid
  end

  it 'cooking_time should be greater than or equal to 0' do
    @recipe.cooking_time = -1
    expect(@recipe).to_not be_valid
  end

  it 'preparation_time should be present' do
    @recipe.preparation_time = nil
    expect(@recipe).to_not be_valid
  end

  it 'preparation_time should be an integer' do
    @recipe.preparation_time = 'string'
    expect(@recipe).to_not be_valid
  end

  it 'preparation_time should be greater than or equal to 0' do
    @recipe.preparation_time = -1
    expect(@recipe).to_not be_valid
  end

  it 'public should be present' do
    @recipe.public = nil
    expect(@recipe).to_not be_valid
  end

  it 'public should be a boolean' do
    @recipe.public = 'string'
    expect(@recipe).to_not be_valid
  end

  it 'should belong to author' do
    assc = described_class.reflect_on_association(:user)
    expect(assc.macro).to eq :belongs_to
  end

  it 'should have many recipe_foods' do
    assc = described_class.reflect_on_association(:recipe_foods)
    expect(assc.macro).to eq :has_many
  end
end

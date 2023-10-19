require 'rails_helper'

RSpec.describe Food do
  before(:all) do
    @user = User.create(name: 'Peter', email: 'peter@gmail.com')
    @food = Food.create(buyer_id: @user.id, name: 'food1', measurement_unit: 'unit', quantity: 2)
  end

  it 'name should be present' do
    @food.name = nil
    expect(@food).to_not be_valid
  end

  it 'name should not be too long' do
    @food.name = 'a' * 251
    expect(@food).to_not be_valid
  end

  it 'measurement_unit should be present' do
    @food.measurement_unit = nil
    expect(@food).to_not be_valid
  end

  it 'price should be an integer' do
    @food.price = 'string'
    expect(@food).to_not be_valid
  end

  it 'price should be greater than or equal to 0' do
    @food.price = -1
    expect(@food).to_not be_valid
  end

  it 'quantity should be present' do
    @food.quantity = nil
    expect(@food).to_not be_valid
  end

  it 'quantity should be an integer' do
    @food.quantity = 'string'
    expect(@food).to_not be_valid
  end

  it 'quantity should be greater than or equal to 0' do
    @food.quantity = -1
    expect(@food).to_not be_valid
  end

  it 'should belong to buyer' do
    assc = described_class.reflect_on_association(:user)
    expect(assc.macro).to eq :belongs_to
  end

  it 'should have many recipe_foods' do
    assc = described_class.reflect_on_association(:recipe_foods)
    expect(assc.macro).to eq :has_many
  end
end

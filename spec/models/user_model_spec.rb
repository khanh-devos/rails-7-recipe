require 'rails_helper'

RSpec.describe User do
  subject { User.create(name: 'John', email: 'john@gmail.com', password: '@manda123') }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'email should be present' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'should have many recipes' do
    assc = described_class.reflect_on_association(:recipes)
    expect(assc.macro).to eql :has_many
  end

  it 'should have many foods' do
    assc = described_class.reflect_on_association(:foods)
    expect(assc.macro).to eq :has_many
  end

  it 'test method recent_posts' do
    Food.create(buyer_id: subject.id, name: 'food1', measurement_unit: 'unit', quantity: 2)
    Food.create(buyer_id: subject.id, name: 'food2', measurement_unit: 'unit', quantity: 3)
    Recipe.create(author_id: subject.id, name: 'recipe3', public: true)
    Recipe.create(author_id: subject.id, name: 'recipe4', public: false)

    expect(subject.foods.size).to eql(2)
    expect(subject.recipes.size).to eql(2)
  end
end

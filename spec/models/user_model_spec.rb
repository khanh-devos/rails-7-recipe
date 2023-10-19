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

  it 'Recipe names should be unique' do
    Recipe.create(author_id: subject.id, name: 'recipe1', public: true, cooking_time: 1, preparation_time: 1,
      description: 'This is a description')
    Recipe.create(author_id: subject.id, name: 'Recipe1', public: true, cooking_time: 1, preparation_time: 1,
      description: 'This is a description')

    expect(subject.recipes.size).to eql(1)
  end
end

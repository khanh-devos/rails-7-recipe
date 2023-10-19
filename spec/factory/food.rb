FactoryBot.define do
  factory :food do
    name { 'Pizza' }
    measurement_unit { 'slice' }
    price { 10 }
    quantity { 8 }
    user
  end
end

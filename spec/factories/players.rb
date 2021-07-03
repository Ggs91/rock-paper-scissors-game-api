FactoryBot.define do
  factory :player do
    name { Faker::Name.first_name }
    move { ['rock', 'paper', 'scissors'].sample }
  end
end

FactoryBot.define do
  factory :game do
    trait :with_players do
      after(:build) do |game|
        2.times do
          create(:player, game: game)
        end
      end
    end
  end
end

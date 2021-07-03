FactoryBot.define do
  factory :game do
    trait :with_players do
      after(:build) do |game|
        2.times do
          game.players << create(:player)
        end
      end
    end
  end
end

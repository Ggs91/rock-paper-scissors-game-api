FactoryBot.define do
  factory :game do
    players { build_list :player, 2 }
  end
end

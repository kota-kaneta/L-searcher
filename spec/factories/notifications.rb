FactoryBot.define do
  factory :notification do
    association :message
    association :room
    association :visitor, factory: :user
    association :visited, factory: :user
  end
end

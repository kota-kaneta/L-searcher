FactoryBot.define do
  factory :follow do
    association :followable
    association :follower
  end
end

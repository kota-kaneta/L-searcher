FactoryBot.define do
  factory :user do
    name { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    search_number { 10_000_000 }
  end
end

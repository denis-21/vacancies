FactoryGirl.define do
  factory :external_client do
    name { Faker::Name.first_name }
    description { Faker::Lorem.paragraph }
  end
end

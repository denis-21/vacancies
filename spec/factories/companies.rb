FactoryGirl.define do
  factory :company do
    name  { Faker::Company.name }
    link  { Faker::Internet.url }
    creator_id { create(:user) }
  end
end

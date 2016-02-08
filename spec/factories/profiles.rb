FactoryGirl.define do
  factory :profile do
    first_name { Faker::Name.first_name }
    last_name  { Faker::Name.last_name }
    bith_date  { Time.zone.today }
  end
end

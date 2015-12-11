FactoryGirl.define do
  factory :vacancy do
    title        { Faker::Team.name }
    description  { Faker::Lorem.paragraph }
    city         { Faker::Address.city }
    country      { ISO3166::Country.all.map{|item| item.name}.sample }
    deadline      { Date.today + (1..5).to_a.sample.days }

    trait :with_company do
      company
    end
  end
end

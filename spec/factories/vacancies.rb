FactoryGirl.define do
  factory :vacancy do
    title        { Faker::Team.name }
    description  { Faker::Lorem.paragraph }
    city         { Faker::Address.city }
    country      { Faker::Address.country }
    deadline      { Date.today }

    trait :with_company do
      company
    end


  end

end

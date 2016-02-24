FactoryGirl.define do
  factory :vacancy do
    title        { Faker::Team.name }
    description  { Faker::Lorem.paragraph }
    city         { Faker::Address.city }
    country      { ISO3166::Country.all.map(&:name).sample }
    continent    { ISO3166::Country.all.map(&:continent).uniq.sort!.sample }
    deadline     { Time.zone.today + (1..5).to_a.sample.days }
    creator_id   { create(:user).id }

    trait :with_company do
      company
    end
  end
end

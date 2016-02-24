FactoryGirl.define do
  factory :company do
    name       { Faker::Company.name }
    link       { Faker::Internet.url }
    continent  { ISO3166::Country.all.map(&:continent).uniq.sort!.sample }
    country    { ISO3166::Country.all.map(&:name).sample }
    city       { Faker::Address.city }
    status     { 'disable' }
    creator_id { create(:user).id }

    factory :company_active do
      status { 'active' }
    end
  end
end

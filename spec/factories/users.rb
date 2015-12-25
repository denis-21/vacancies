FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password '12345678'
    password_confirmation '12345678'
    admin false

    factory :admin_user do
      admin true
    end
  end
end

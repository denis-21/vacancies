FactoryGirl.define do
  factory :user do
    email {Faker::Internet.email}
    password '123456'
    password_confirmation '123456'
    admin false

    factory :admin_user do
      admin true
    end
  end
end

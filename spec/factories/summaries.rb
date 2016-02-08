include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :summary do
    email       { Faker::Internet.email }
    first_name  { Faker::Name.first_name }
    last_name   { Faker::Name.last_name }
    file        { fixture_file_upload('spec/support/assets/Screen Shot 2015-12-16 at 09.36.28.pdf', 'application/pdf') }
  end
end

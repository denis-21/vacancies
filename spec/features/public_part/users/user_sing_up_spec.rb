require 'rails_helper'

RSpec.feature 'PageVacancies', type: :feature do
  let!(:user_data)  { attributes_for :user }
  let(:user_sign_up_page) { UserSingUpPage.new }

  before do
    user_sign_up_page.load
  end

  scenario 'when filled with all the data' do
    user_sign_up_page.email.set user_data[:email]
    user_sign_up_page.password.set user_data[:password]
    user_sign_up_page.password_confirmation.set user_data[:password_confirmation]
    user_sign_up_page.sing_up.click
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

   scenario 'when do not fill in the email' do
    user_sign_up_page.password.set user_data[:password]
    user_sign_up_page.password_confirmation.set user_data[:password_confirmation]
    user_sign_up_page.sing_up.click
    expect(page).to have_content("Email can't be blank")
  end

   scenario 'when do not fill in the password confirmation' do
    user_sign_up_page.email.set user_data[:email]
    user_sign_up_page.password.set user_data[:password]
    user_sign_up_page.sing_up.click
    expect(page).to have_content("Password confirmation doesn't match Password")
  end
end

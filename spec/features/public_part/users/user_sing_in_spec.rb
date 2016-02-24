require 'rails_helper'

RSpec.feature 'PageVacancies', type: :feature do
  let!(:user) { create :user }
  let!(:user_data)  { attributes_for :user }
  let(:user_sign_in_page) { UserSingInPage.new }

  before do
    user_sign_in_page.load
  end

  scenario 'when filled with all the data' do
    user_sign_in_page.email.set user.email
    user_sign_in_page.password.set '12345678'
    user_sign_in_page.sing_in.click
    expect(page).to have_content('Signed in successfully.')
  end

  scenario 'when do not fill in the password' do
    user_sign_in_page.email.set user.email
    user_sign_in_page.sing_in.click
    expect(page).to have_content('Invalid email or password.')
  end

  scenario 'when filled with incorrect data' do
    user_sign_in_page.email.set user_data[:email]
    user_sign_in_page.password.set user_data[:password]
    user_sign_in_page.sing_in.click
    expect(page).to have_content('Invalid email or password.')
  end
end

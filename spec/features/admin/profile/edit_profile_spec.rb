require 'rails_helper'

RSpec.feature 'EditProfile', type: :feature do
  let!(:user) { create :user }
  let!(:profile_data) { attributes_for :profile }
  let(:edit_profile_page) { EditProfilePage.new }

  before do
    login_as user
    edit_profile_page.load
  end

  scenario 'fill in the form' do
    edit_profile_page.first_name.set profile_data[:first_name]
    edit_profile_page.last_name.set profile_data[:last_name]
    edit_profile_page.bith_date.set profile_data[:bith_date]
    edit_profile_page.image.set Rails.root.join('spec/support/assets/test.jpg')
    edit_profile_page.button_add.click
    expect(edit_profile_page).to have_content('Your profile updated')
  end

  scenario 'fill out the form and upload a text file' do
    edit_profile_page.first_name.set profile_data[:first_name]
    edit_profile_page.last_name.set profile_data[:last_name]
    edit_profile_page.bith_date.set profile_data[:bith_date]
    edit_profile_page.image.set Rails.root.join('spec/support/assets/test_text.txt')
    edit_profile_page.button_add.click
    expect(edit_profile_page).to have_content('Picture image content type is invalid')
  end
end

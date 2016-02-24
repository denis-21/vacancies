require 'rails_helper'

RSpec.feature 'CreateCompany', type: :feature do
  let(:user_data) { attributes_for :user }
  let(:companies_data) { attributes_for :company }
  let(:company_step_page) { CompaniesStepPage.new }
  let(:user_step_page) { UsersStepPage.new }
  let(:confirm_step_page) { ConfirmsStepPage.new }

  describe 'Companies step' do
    before do
      company_step_page.load
    end

    scenario 'fill in the form' do
      company_step_page.submit_form(companies_data)
      expect(user_step_page).to be_displayed
    end

    scenario 'fill all in the form, except name' do
      company_step_page.submit_form(companies_data.except(:name))
      expect(company_step_page).to have_content("Name can't be blank")
    end
  end

  describe 'Users step after companies step' do
    before do
      company_step_page.load
      company_step_page.submit_form(companies_data)
    end

    scenario 'fill in the form' do
      user_step_page.submit_form(user_data)
      expect(confirm_step_page).to be_displayed
    end

    scenario 'fill all in the form, except password confirmation' do
      user_step_page.submit_form(user_data.except(:password_confirmation))
      expect(user_step_page).to have_content("Password confirmation doesn't match Password")
    end
  end

  describe 'Users step before companies step' do
    before do
      user_step_page.load
    end

    scenario 'fill in the form' do
      user_step_page.submit_form(user_data)
      expect(company_step_page).to be_displayed
    end

    scenario 'fill all in the form, except email' do
      user_step_page.submit_form(user_data.except(:email))
      expect(user_step_page).to have_content("Email can't be blank")
    end
  end

  describe 'Confirms step afrer companies and users' do
    before do
      company_step_page.load
      company_step_page.submit_form(companies_data)
      user_step_page.submit_form(user_data)
    end

    it 'check data' do
      expect(confirm_step_page).to have_content(companies_data[:continent])
      expect(confirm_step_page).to have_content(companies_data[:country])
      expect(confirm_step_page).to have_content(companies_data[:city])
      expect(confirm_step_page).to have_content(companies_data[:name])
      expect(confirm_step_page).to have_content(companies_data[:link])
      expect(confirm_step_page).to have_content(user_data[:email])
    end

    scenario 'click button confirm' do
      confirm_step_page.confim_button.click
      expect(page).to have_content('Confirmation expected administrator')
    end

    scenario 'Delete copmaies cookie and click button confirm' do
      page.driver.browser.clear_cookies
      page.driver.browser.set_cookie("companies=#{CGI.escape(companies_data.except(:name).to_json)}")
      page.driver.browser.set_cookie("users=#{CGI.escape(user_data.to_json)}")
      page.driver.browser.set_cookie("step=#{CGI.escape('confirms')}")
      confirm_step_page.confim_button.click
      expect(confirm_step_page).to have_content('Company is invalid')
    end
  end

  describe 'Confirms step right after companies ' do
    before do
      company_step_page.load
      company_step_page.submit_form(companies_data)
    end

    scenario 'click link confirms in steps menu' do
      user_step_page.steps_menu.confirms_step.click
      expect(user_step_page).to be_displayed
    end
  end
end

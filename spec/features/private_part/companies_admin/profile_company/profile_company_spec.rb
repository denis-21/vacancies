require 'rails_helper'

RSpec.feature 'ProfileComapny', type: :feature do
  let!(:manager)  { create :user_with_company }
  let!(:company)  { manager.company }
  let!(:vacancy)  { create :vacancy, company: company, creator_id: manager.id  }
  let!(:vacancy2) { create :vacancy, company: company, creator_id: manager.id  }

  let(:profile_company_page) { ProfileCompanyPage.new }

  before do
    login_as manager
    profile_company_page.load
  end

  scenario 'Load page company' do
    expect(profile_company_page).to be_displayed
  end

  describe 'Visit to company page' do
    it 'have name company' do
      expect(profile_company_page.name_company.text).to eq(company.name)
    end
    it 'have link company' do
      expect(profile_company_page.link.text).to eq(company.link)
    end

    it 'have title vacancies' do
      expect(profile_company_page.title_vacancies).to match_array([vacancy.title, vacancy2.title])
    end
  end

  scenario 'click title vacancy leads to a vacancy page' do
    profile_company_page.click_vacancy(vacancy.title)
    expect(ManageVacancyPage.new).to be_displayed
  end
end

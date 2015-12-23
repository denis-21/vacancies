require 'rails_helper'

RSpec.feature 'AdminPageVacancy', type: :feature do
  let!(:user) { create :user }
  let!(:vacancy) { create :vacancy, :with_company, creator_id: user.id }

  let(:admin_vacancy_page) { AdminVacancyPage.new }

  before do
    login_as user
    admin_vacancy_page.load(id: vacancy.id)
  end

  scenario 'Load page vacancy' do
    expect(admin_vacancy_page).to be_displayed
  end

  describe 'Visit to vacancy page' do
    it 'have elements to admin vacancy page' do
      expect(admin_vacancy_page).to be_all_there
    end

    it 'have title vacancy' do
      expect(admin_vacancy_page).to have_content(vacancy.title)
    end
    it 'have country vacancy' do
      expect(admin_vacancy_page).to have_content(vacancy.country)
    end

    it 'have city vacancy' do
      expect(admin_vacancy_page).to have_content(vacancy.city)
    end
  end
end

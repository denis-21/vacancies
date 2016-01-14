require 'rails_helper'

RSpec.feature 'ManagePageVacancy', type: :feature do
  let!(:user) { create :user }
  let!(:vacancy) { create :vacancy, :with_company, creator_id: user.id }

  let(:manage_vacancy_page) { ManageVacancyPage.new }

  before do
    login_as user
    manage_vacancy_page.load(id: vacancy.id)
  end

  scenario 'Load page vacancy' do
    expect(manage_vacancy_page).to be_displayed
  end

  describe 'Visit to vacancy page' do
    it 'have elements to admin vacancy page' do
      expect(manage_vacancy_page).to be_all_there
    end

    it 'have title vacancy' do
      expect(manage_vacancy_page).to have_content(vacancy.title)
    end
    it 'have country vacancy' do
      expect(manage_vacancy_page).to have_content(vacancy.country)
    end

    it 'have city vacancy' do
      expect(manage_vacancy_page).to have_content(vacancy.city)
    end
  end
end

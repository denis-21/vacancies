require 'rails_helper'

RSpec.feature 'ManagePageVacancies', type: :feature do
  let!(:user) { create :user }
  let!(:company)  { create :company, creator_id: user.id }
  let!(:company2) { create :company, creator_id: user.id }
  let!(:vacancy)  { create :vacancy, company: company, creator_id: user.id }
  let!(:vacancy2) { create :vacancy, company: company2, creator_id: user.id }
  let(:manage_vacancies_page) { ManageVacanciesPage.new }

  before do
    login_as user
    manage_vacancies_page.load
  end

  describe 'Visit to vacancies page' do
    it 'have elements to admin vacancies page' do
      expect(manage_vacancies_page).to be_all_there
    end

    it 'have content title vacancies' do
      expect(manage_vacancies_page.vacancies_title).to match_array(Vacancy.pluck(:title))
    end
  end

  scenario 'Click to title vacancy leads to a page vacancy' do
    manage_vacancies_page.click_vacancy(vacancy2.title)
    expect(ManageVacancyPage.new).to be_displayed
  end

  scenario 'Click to button new vacancy leads to a page new vacancy' do
    manage_vacancies_page.button_new.click
    expect(ManageNewVacancyPage.new).to be_displayed
  end

  scenario 'Click delete button' do
    manage_vacancies_page.delete_vacancy(vacancy.title)
    expect(manage_vacancies_page).not_to have_content(vacancy.title)
  end
end

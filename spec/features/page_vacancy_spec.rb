require 'rails_helper'
require 'pages/vacancy_page'

RSpec.feature "PageVacancy", type: :feature do
  let!(:vacancy)  { create :vacancy,:with_company }

  let(:vacancy_page) { VacancyPage.new }

  before do
    vacancy_page.load(id: vacancy.id)
  end

  scenario 'Load page vacancy' do
    expect(vacancy_page).to be_displayed
  end


  describe 'Visit to vacancy page' do


    it 'have title vacancy' do
      expect(vacancy_page).to have_content (vacancy.title)
    end
    it 'have country vacancy' do
      expect(vacancy_page).to have_content (vacancy.country)
    end

    it 'have city vacancy' do
      expect(vacancy_page).to have_content (vacancy.city)
    end

  end

end

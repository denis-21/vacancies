require 'rails_helper'

RSpec.feature 'Update vacancy', type: :feature do
  let!(:user) { create :user }
  let!(:company) { create :company, creator_id: user.id }
  let!(:vacancy) { create :vacancy, creator_id: user.id, company_id: company.id }
  let(:edit_vacncy_page) { AdminEditVacancyPage.new }

  before do
    login_as user
    edit_vacncy_page.load(id: vacancy.id)
  end

  scenario 'when filled with title and description vacancy' do
    edit_vacncy_page.title.set 'Test'
    edit_vacncy_page.description.set 'test desc'
    edit_vacncy_page.button_add.click
    expect(AdminVacancyPage.new).to have_content('Test')
  end

  scenario 'when do not fill in the title vacancy' do
    edit_vacncy_page.title.set ''
    edit_vacncy_page.button_add.click
    expect(edit_vacncy_page).to have_content("Title can't be blank")
  end

  scenario 'when do not fill in the desc vacancy' do
    edit_vacncy_page.description.set ''
    edit_vacncy_page.button_add.click
    expect(edit_vacncy_page).to have_content("Description can't be blank")
  end
end

require 'rails_helper'

RSpec.describe PrivatePart::CompaniesAdmin::SummariesController, type: :controller do
  let!(:manager) { create :user_with_company }
  let!(:vacancy) { create :vacancy, company: manager.company, creator_id: manager.id }
  let!(:summary) { create :summary, vacancy: vacancy }

  describe 'PUT #update' do

    before do
      sign_in manager
    end

    it 'renders nothing' do
      put :update, vacancy_id: vacancy, id: summary, status: 'test', format: :js
      expect(response.body).to be_blank
      expect(response.status).to eq(204)
    end
  end
end

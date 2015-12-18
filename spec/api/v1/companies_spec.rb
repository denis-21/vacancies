require 'rails_helper'

RSpec.describe 'Companies', type: :request do
  let!(:company) { create :company }
  let!(:vacancy) { create :vacancy, company: company }

  describe 'GET #index' do
    before do
      get api_v1_companies_url, format: :json
    end

    it { expect(response.status).to eq(200) }

    it { expect(response).to render_template(:index) }

    it { expect(response.content_type).to eq(Mime::JSON) }

    it 'check count companies to response' do
      expect(json_body.length).to eq(Company.all.count)
    end

    it 'check company name' do
      expect(json_body.collect { |company| company['name'] }).to include(company.name)
    end

    it 'check company url' do
      expect(json_body.collect { |company| company['url'] }).to include(api_v1_company_url(company, format: :json))
    end
  end

  describe 'GET #show' do
    before do
      get api_v1_company_url(company), format: :json
    end

    it { expect(response.status).to eq(200) }

    it { expect(response).to render_template(:show) }

    it { expect(response.content_type).to eq(Mime::JSON) }

    it { expect(json_body['name']).to eq(company.name) }

    it { expect(json_body['link']).to eq(company.link) }

    it { expect(json_body['vacancies'].first['title']).to eq(vacancy.title) }

    it { expect(json_body['vacancies'].first['deadline']).to eq(vacancy.deadline.strftime('%Y-%m-%d')) }

    it { expect(json_body['vacancies'].first['url']).to eq(api_v1_vacancy_url(vacancy, format: :json)) }
  end
end

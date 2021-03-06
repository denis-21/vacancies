require 'rails_helper'

RSpec.describe 'Companies', type: :request do
  let!(:company) { create :company }
  let!(:vacancy) { create :vacancy, company: company }
  let!(:external_client) { create :external_client }

  before do
    request
  end

  describe 'GET #index' do
    context 'when not access token' do
      let(:request) { get api_v1_companies_url, format: :json }

      it { expect(response.status).to eq(401) }
      it { expect(json_body['errors']).to eq('No token authorization') }
    end

    context 'when is not correct access token' do
      let(:request) { get api_v1_companies_url, format: :json, access_token: 'not_correct_token' }

      it { expect(response.status).to eq(401) }
      it { expect(json_body['errors']).to eq('Invalid token authorization') }
    end

    context 'when access token' do
      let(:request) { get api_v1_companies_url, format: :json, access_token: external_client.secret_key }

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
  end

  describe 'GET #show' do
    context 'when not access token' do
      let(:request) { get api_v1_company_url(company), format: :json }

      it { expect(response.status).to eq(401) }
      it { expect(json_body['errors']).to eq('No token authorization') }
    end

    context 'when is not correct access token' do
      let(:request) { get api_v1_company_url(company), format: :json, access_token: 'not_correct_token' }

      it { expect(response.status).to eq(401) }
      it { expect(json_body['errors']).to eq('Invalid token authorization') }
    end

    context 'when access token' do
      let(:request) { get api_v1_company_url(company), format: :json, access_token: external_client.secret_key }

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
end

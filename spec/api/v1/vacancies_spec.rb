require 'rails_helper'

RSpec.describe 'Vacancies', type: :request do
  let!(:company) { create :company }
  let!(:vacancy) { create :vacancy, company: company }
  let!(:external_client) { create :external_client }

  before do
    request
  end

  describe 'GET #index' do
    context 'when not access token' do
      let(:request) { get api_v1_vacancies_url, format: :json }

      it { expect(response.status).to eq(401) }

      it { expect(json_body['errors']).to eq('No token authorization') }
    end

    context 'when is not correct access token' do
      let(:request) { get api_v1_vacancies_url, format: :json, access_token: 'not_correct_token' }

      it { expect(response.status).to eq(401) }

      it { expect(json_body['errors']).to eq('Invalid token authorization') }
    end

    context 'when access token' do
      let(:request) { get api_v1_vacancies_url, format: :json, access_token: external_client.secret_key }

      it { expect(response.status).to eq(200) }

      it { expect(response).to render_template(:index) }

      it { expect(response.content_type).to eq(Mime::JSON) }

      it 'check count active vacancies to response' do
        expect(json_body.length).to eq(Vacancy.active.count)
      end

      it 'check vacancy title' do
        expect(json_body.collect { |vacancy| vacancy['title'] }).to include(vacancy.title)
      end

      context 'check value field first vacancy' do
        before do
          @first_vacancy = json_body.first
        end

        it { expect(@first_vacancy['title']).to eq(vacancy.title) }

        it { expect(@first_vacancy['country']).to eq(vacancy.country) }

        it { expect(@first_vacancy['city']).to eq(vacancy.city) }
      end
    end
  end

  describe 'GET #show' do
    context 'when not access token' do
      let(:request) { get api_v1_vacancy_url(vacancy), format: :json }

      it { expect(response.status).to eq(401) }

      it { expect(json_body['errors']).to eq('No token authorization') }
    end

    context 'when is not correct access token' do
      let(:request) { get api_v1_vacancy_url(vacancy), format: :json, access_token: 'not_correct_token' }

      it { expect(response.status).to eq(401) }

      it { expect(json_body['errors']).to eq('Invalid token authorization') }
    end

    context 'when access token' do
      let(:request) { get api_v1_vacancy_url(vacancy), format: :json, access_token: external_client.secret_key }

      it { expect(response.status).to eq(200) }

      it { expect(response).to render_template(:show) }

      it { expect(response.content_type).to eq(Mime::JSON) }

      it { expect(json_body['company']['name']).to eq(company.name) }

      it { expect(json_body['company']['link']).to eq(company.link) }

      it { expect(json_body['company']['url']).to eq(api_v1_company_url(company, format: :json)) }

      it { expect(json_body['title']).to eq(vacancy.title) }

      it { expect(json_body['description']).to eq(vacancy.description) }

      it { expect(json_body['country']).to eq(vacancy.country) }

      it { expect(json_body['city']).to eq(vacancy.city) }
    end
  end
end

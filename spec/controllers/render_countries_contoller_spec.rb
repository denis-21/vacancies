require 'rails_helper'

RSpec.describe RenderCountriesController, type: :controller do
  describe 'GET #index' do
    before do
      xhr :get, :index, continent: 'Europe', format: :js
    end

    it { expect(response.status).to eq(200) }
    it { expect(response).to render_template(:index, format: :js) }
    it { expect(response.content_type).to eq(Mime::JS) }
 end
end

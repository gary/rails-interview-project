# frozen_string_literal: true

require 'rails_helper'

require 'support/database_cleaner'
require 'support/factory_girl'

RSpec.describe 'Questions API' do
  describe '#index' do
    context 'when the Tenant successfully authenticates' do
      let!(:tenant) { create(:tenant) }

      it 'returns all non-private Questions' do
        get '/questions', api_key: tenant.api_key

        expect(response).to render_template(:index)
          .and have_http_status(:ok)
      end
    end

    context 'when the Tenant fails to authenticate' do
      context 'when they provide an invalid API key' do
        it 'returns a useful error message' do
          get '/questions', api_key: 'invalid-api-key'

          expect(response.body).to include('Invalid API key')
          expect(response).to have_http_status(:unauthorized)
        end
      end

      context 'when they do not provide an API key' do
        it 'returns a useful error message' do
          get '/questions'

          expect(response.body).to include('Invalid API key')
          expect(response).to have_http_status(:unauthorized)
        end
      end
    end
  end
end

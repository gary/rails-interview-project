# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Questions API' do
  describe '#index' do
    it 'returns all Questions' do
      get '/questions'

      expect(response.content_type).to eq('application/json')
      expect(response).to render_template(:index)
        .and have_http_status(:ok)
    end
  end
end

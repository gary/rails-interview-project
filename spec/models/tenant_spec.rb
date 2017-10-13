# frozen_string_literal: true

require 'rails_helper'

require 'support/database_cleaner'
require 'support/factory_girl'

describe Tenant do
  let(:tenant) { build(:tenant) }

  describe '#track_access' do
    it "increment's the Tenant's access_count" do
      expect { tenant.track_access }.to change { tenant.access_count }.by(1)
    end
  end
end

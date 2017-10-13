# frozen_string_literal: true

# The consumer of our API
class Tenant < ActiveRecord::Base
  before_create :generate_api_key

  def track_access
    increment(:access_count).save
  end

  private

  def generate_api_key
    self.api_key = SecureRandom.hex(16)
  end
end

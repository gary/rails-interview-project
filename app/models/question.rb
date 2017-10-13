# frozen_string_literal: true

# A request for information by an asker ({User})
class Question < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  belongs_to :user

  # @note The preferred name "public" collides with ActiveRecord's API
  scope :not_private, -> { where(private: false) }
end

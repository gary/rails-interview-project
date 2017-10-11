# frozen_string_literal: true

# A request for information by an asker ({User})
class Question < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  belongs_to :user
end

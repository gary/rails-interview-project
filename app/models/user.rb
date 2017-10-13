# frozen_string_literal: true

# Asks {Question}s and provides {Answer}s
class User < ActiveRecord::Base
  has_many :questions, dependent: :destroy, inverse_of: :asker
  has_many :answers,   dependent: :destroy, inverse_of: :answerer
end

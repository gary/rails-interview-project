# frozen_string_literal: true

FactoryGirl.define do
  factory :answer do
    question
    user

    body 'Answer'
  end
end

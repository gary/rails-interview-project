# frozen_string_literal: true

# The response to a {Question} provided by an answerer ({User})
class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
end

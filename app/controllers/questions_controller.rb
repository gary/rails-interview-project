# frozen_string_literal: true

# The public REST API for Questions
# @version 1.0
class QuestionsController < ApplicationController
  # @api
  def index
    @questions = Question.all
  end
end

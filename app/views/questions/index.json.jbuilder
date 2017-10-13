# frozen_string_literal: true

json.questions @questions do |question|
  json.title question.title

  json.user do
    json.id question.user.id
    json.name question.user.name
  end

  json.answers question.answers do |answer|
    json.body answer.body

    json.user do
      json.id answer.user.id
      json.name answer.user.name
    end
  end
end

# frozen_string_literal: true

class AnswerDecorator < ApplicationDecorator
  delegate_all
  decorates_association :user

  def fromated_created_at
    l created_at, format: :long   #локализируем формат даты и времени
  end
end
# frozen_string_literal: true

class QuestionDecorator < ApplicationDecorator
  delegate_all
  decorates_association :user

  def fromated_created_at
    l created_at, format: :long
  end
end
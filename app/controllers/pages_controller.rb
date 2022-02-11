# frozen_string_literal: true

# pages controller
class PagesController < ApplicationController
  def index
    @name = params[:name]
  end
end

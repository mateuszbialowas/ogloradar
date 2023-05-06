# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    flash.now[:info] = 'This is an info message.'
    flash.now[:success] = 'This is a success message.'
    flash.now[:error] = 'This is an error message.'
    flash.now[:alert] = 'This is an alert message.'
  end
end

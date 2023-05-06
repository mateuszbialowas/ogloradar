# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    flash[:info] = 'This is an info message.'
    flash[:success] = 'This is a success message.'
    flash[:error] = 'This is an error message.'
    flash.now[:alert] = 'This is an alert message.'
  end
end

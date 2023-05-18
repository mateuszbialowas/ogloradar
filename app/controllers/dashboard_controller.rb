# frozen_string_literal: true

class DashboardController < AuthenticatedController
  def index
    flash[:notice] = 'Welcome to your dashboard'
  end
end

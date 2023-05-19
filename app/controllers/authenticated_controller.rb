# frozen_string_literal: true

class AuthenticatedController < ApplicationController
  before_action :authenticate_user!
  layout 'dashboard'
end

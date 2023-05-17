# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'mateusz.bialowas+ogloradar-stg2@gmail.com'
  layout 'mailer'
end

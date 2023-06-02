# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'ogloradar@mateuszbialowas.com'
  layout 'mailer'
end

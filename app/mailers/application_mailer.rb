# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@mateuszbialowas.com'
  layout 'mailer'
end

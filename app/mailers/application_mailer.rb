# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  helper MailHelper
  default from: 'ogloradar@mateuszbialowas.com'
  layout 'mailer'
end

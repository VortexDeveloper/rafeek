class ApplicationMailer < ActionMailer::Base
  include SendGrid
  default from: 'Rafeek Rifas <noreply@vortexdeveloper.com>'
  layout 'mailer'
end

class ApplicationMailer < ActionMailer::Base
  default to: "admin@example.com"
  layout "mailer"
end

class Notifier < ActionMailer::Base

  default from: 'notificaciones@donar.com.ar'
  layout 'email'

end

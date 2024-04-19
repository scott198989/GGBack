# app/mailers/appointment_mailer.rb
class AppointmentMailer < ApplicationMailer
  def reminder(appointment)
    @appointment = appointment
    @user = appointment.user
    mail(to: @user.email, subject: 'Appointment Reminder')
  end
end

# app/controllers/appointments_controller.rb
class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.all
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      # Send email reminder
      AppointmentMailer.reminder(@appointment).deliver_later
      # Send SMS reminder (optional)
      SmsSender.send_reminder(@appointment) if defined?(SmsSender)
      redirect_to @appointment, notice: 'Appointment was successfully created and reminder sent.'
    else
      render :new
    end
  end

  def edit
    @appointment = Appointment.find(params[:id])
  end

  def update
    @appointment = Appointment.find(params[:id])
    if @appointment.update(appointment_params)
      # Send email reminder
      AppointmentMailer.reminder(@appointment).deliver_later
      # Send SMS reminder (optional)
      SmsSender.send_reminder(@appointment) if defined?(SmsSender)
      redirect_to @appointment, notice: 'Appointment was successfully updated and reminder rescheduled.'
    else
      render :edit
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    redirect_to appointments_url, notice: 'Appointment was successfully destroyed.'
  end

  private

  def appointment_params
    params.require(:appointment).permit(:user_id, :service_id, :date, :status)
  end
end

# app/controllers/payments_controller.rb
class PaymentsController < ApplicationController
  def new
    @appointment = Appointment.find(params[:appointment_id])
    @payment = Payment.new
  end

  def create
    @appointment = Appointment.find(params[:appointment_id])
    @payment = @appointment.build_payment(payment_params)
    if @payment.save
      redirect_to appointment_payment_path(@appointment, @payment), notice: 'Payment was successfully created.'
    else
      render :new
    end
  end

  def show
    @payment = Payment.find(params[:id])
  end

  private

  def payment_params
    params.require(:payment).permit(:amount, :status, :transaction_id)
  end
end

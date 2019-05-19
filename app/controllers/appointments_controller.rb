class AppointmentsController < ApplicationController
  before_action :authenticate_le!
  before_action :my_le, only: [:edit, :update, :destroy]

  def index
    @appointments = Appointment.all
  end

  def show
     @appointment = Appointment.find(params[:id])
     @le = @appointment.le
     @client = @appointment.client
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)

    if @appointment.save
      redirect_to appointment_path(@appointment)
    else
      render :new
    end
  end

  def edit
    @appointment = Appointment.find(params[:id])
    redirect_to appointment_path(@appointment)
  end

  def update
    @appointment = Appointment.find(params[:id])

    @appointment.update(appointment_params)

    if @appointment.save
      redirect_to @appointment
    else
      render :edit
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    redirect_to appointments_path
  end


  private

  def appointment_params
    params.require(:appointment).permit(:date, :time, :client_id, :le_id)
  end

  def my_le
    # if appointment.le is the current_le allow edit, update, destroy else redirect_to appointments_path
  end
end

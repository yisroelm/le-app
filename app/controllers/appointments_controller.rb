class AppointmentsController < ApplicationController
  before_action :authenticate_le!

  def index
    @appointments = current_le.appointments
  end

  def show
     @appointment = Appointment.find(params[:id])
     @le = @appointment.le
     @client = @appointment.client
  end

  def new
    @appointment = Appointment.new(le_id: current_le.id)
    @le_clients = Client.where(product_id: current_le.id)
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      # flash[:alert] = "Successfully created appointment" 
      redirect_to appointment_path(@appointment)
    else
      flash[:alert] = @appointment.errors.full_messages
      render :new
    end
  end

  def edit
    @appointment = Appointment.find(params[:id])
  end

  def update
    @appointment = Appointment.find(params[:id])

    if @appointment.update(appointment_params)
      # flash[:notice] = "Successfully created appointment" 
      redirect_to appointment_path(@appointment)
    else
      # flash[:alert] = @appointment.errors.full_messages
        render :edit
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
      @appointment.destroy
    redirect_to appointments_path
    flash[:notice] = "Appointment deleted."
  end

  def most_recent_appointment
    @asc_appointments = Appointment.most_recent_appointment
  end


  private

  def appointment_params
    params.require(:appointment).permit(:date, :time, :client_id, :le_id)
  end
end

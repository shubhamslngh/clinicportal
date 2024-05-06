class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.all
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    Rails.logger.debug @appointment.inspect
      if @appointment.save
        redirect_to appointments_path, notice: 'Appointment was successfully created.'
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
      redirect_to appointments_path, notice: 'Appointment was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy

    respond_to do |format|
      format.html { redirect_to appointments_path, notice: 'Appointment was successfully destroyed.' }
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@appointment) }
    end
end


  private

  def appointment_params
    params.require(:appointment).permit(:time, :description, :date, :patient_id)
  end

end

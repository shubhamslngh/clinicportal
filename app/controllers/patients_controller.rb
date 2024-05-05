class PatientsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_receptionist!
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  # GET /patients
  def index
    @patients = Patient.all
  end

  # GET /patients/1
  def show
  end

  # GET /patients/new
  def new
    @patient = Patient.new
  end

  # POST /patients
  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to @patient, notice: 'Patient was successfully created.'
    else
      render :new
    end
  end

  # GET /patients/1/edit
  def edit
  end

  # PATCH/PUT /patients/1
  def update
    if @patient.update(patient_params)
      redirect_to @patient, notice: 'Patient was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /patients/1
 def destroy
  @patient = Patient.find(params[:id])
  @patient.destroy

  respond_to do |format|
    format.html { redirect_to patients_url, notice: 'Patient was successfully destroyed.' }
    format.turbo_stream { render turbo_stream: turbo_stream.remove(@patient) }
  end
end


  private

  # Use callbacks to share common setup or constraints between actions
  def set_patient
    @patient = Patient.find(params[:id])
  end

  # Only allow a list of trusted parameters through
  def patient_params
    params.require(:patient).permit(:name, :age, :address, :phone, :email)
  end

  # Ensure that only receptionists can access patient data
  def ensure_receptionist!
    redirect_to root_path, alert: 'You are not authorized to view this page.' unless current_user.receptionist?
  end
end

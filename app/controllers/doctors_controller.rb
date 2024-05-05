class DoctorsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_doctor

  def index
    @patients = Patient.all.order(created_at: :desc)
    @patients_by_day = Patient.group_by_day(:created_at).count
  end



  private

  def check_doctor
    redirect_to root_path, alert: 'Access Denied' unless current_user.doctor?
  end
end

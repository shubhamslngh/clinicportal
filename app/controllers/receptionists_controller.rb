# app/controllers/receptionists_controller.rb
class ReceptionistsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_receptionist!

  def index
    # This action will render the default `index.html.erb` for receptionists
  end

  private

  def ensure_receptionist!
    unless current_user.receptionist?
      redirect_to root_path, alert: 'You are not authorized to access this page.'
    end
  end
end

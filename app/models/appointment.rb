class Appointment < ApplicationRecord
  belongs_to :patient
  attribute :date, :datetime
  attribute :time, :datetime  

  # Use :text for description
  attribute :description, :text
end

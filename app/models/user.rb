class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { doctor: 'doctor', receptionist: 'receptionist' }
end

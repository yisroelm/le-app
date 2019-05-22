class Appointment < ApplicationRecord
  belongs_to :le
  belongs_to :client

  def self.most_recent_appointment
    Appointment.order(created_at: :asc)
  end

  def date_must_be_in_future
    
  end
end

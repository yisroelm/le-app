class Appointment < ApplicationRecord
  belongs_to :le
  belongs_to :client
   validates :date, presence: true
   validates :time, presence: true

  def self.most_recent_appointment
    Appointment.order(created_at: :asc)
  end

  def date_must_be_in_future
    if date < Date.today
      errors.add :date, "Must Be In The Future"
    end
  end
  
end

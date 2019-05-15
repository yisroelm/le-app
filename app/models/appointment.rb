class Appointment < ApplicationRecord
  belongs_to :le
  belongs_to :client
end

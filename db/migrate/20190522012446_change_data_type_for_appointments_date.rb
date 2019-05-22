class ChangeDataTypeForAppointmentsDate < ActiveRecord::Migration[5.2]
  change_table :appointments do |t|
    t.change :date, :date
  end
end

class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.string :date
      t.string :time
      t.integer :client_id
      t.integer :le_id

      t.timestamps
    end
  end
end

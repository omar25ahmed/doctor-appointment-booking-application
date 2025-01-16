class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.integer :slot_id
      t.integer :patient_id
      t.datetime :reserved_at

      t.timestamps
    end
  end
end

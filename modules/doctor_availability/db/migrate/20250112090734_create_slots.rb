class CreateSlots < ActiveRecord::Migration[6.1]
  def change
    create_table :doctor_availability_slots do |t|
      t.datetime :time
      t.integer :doctor_id
      t.string :doctor_name
      t.decimal :cost
      t.boolean :is_reserved, default: false

      t.timestamps
    end

    add_index :doctor_availability_slots, :doctor_id
    add_index :doctor_availability_slots, :time
    add_index :doctor_availability_slots, :is_reserved
  end
end
